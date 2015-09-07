<?php
class admin_controller extends base_controller
{
	protected $nav;
	protected $app;
	protected $controller;
	
	function __construct()
	{
		if(!isset($_SESSION))
			session_start();
		
		$this->app = \maverick\maverick::getInstance();
		
		$params = $this->app->controller['args'];
		$params = $this->clean_params($params); //$this->clean_params($params);
		$this->nav = view::make('includes/nav')->with('params', $params)->render(false);
	}
	
	function admin($params)
	{
		$params = $this->clean_params($params);
		
		if(!$this->check_login_status($params))
			view::redirect('/' . $this->app->get_config('tweed.admin_path') . '/login');
		
		if(!count($params))
			$params[0] = 'dash';
		
		switch($params[0])
		{
			case 'dash':
				$campaigns = content::get_all_campaigns();
				$headers = '["ID #","Name","Start","End","Last Used","Search Params","Created By","Modified By","Status","Actions"]';
				$data = array();
				foreach($campaigns as $campaign)
				{
					$data[] = array(
						$campaign['id'],
						$campaign['name'],
						$campaign['start'],
						$campaign['end'],
						$campaign['last_used'],
						$campaign['query_params'],
						$campaign['created_by'],
						$campaign['modified_by'],
						($campaign['force_deactivated'] == 'yes')?'<span class="deactivated">deactivated</span>':((strtotime($campaign['end']) < time() )?'<span class="ended">ended</span>':'<span class="active">active</span>' ),
						content::generate_actions('campaign', $campaign['id'], array('edit', 'deactivate') ),
					);
				}
				
				$campaigns_table = new \helpers\html\tables('forms', 'layout', $data, $headers);
				$campaigns_table->class = 'item_table';
				
				$view_params = array(
					'campaigns'=>$campaigns_table->render(),
					'campaigns_buttons'=> content::generate_actions('campaign', '', array('new campaign'), 'full', 'a'),
					'scripts'=>array(
						'/js/cms/forms.js'=>10, 
					)
				);
				
				$this->load_view($params[0], $view_params );
				break;
			case 'campaign':
				if(!isset($params[1]))
					return false;
				
				switch($params[1])
				{
					case 'edit':
						if(!isset($params[2]))
							return false;
						
						$errors = false;

						$campaign_buttons = content::generate_actions($params[1], $params[2], array('save', 'add query'), 'full', 'button');
						
						$campaign = content::get_campaign($params[2]);

						// build up the extra elements specifically for the campaign details - not the queries
						$campaign_details = \helpers\html\html::load_snippet(MAVERICK_BASEDIR . 'vendor/helpers/html/snippets/label_wrap.php', array(
							'label'=>'Campaign Name',
							'element'=>\helpers\html\html::load_snippet(MAVERICK_BASEDIR . 'vendor/helpers/html/snippets/input_text.php', array(
									'value'=>"value=\"{$campaign[0]['name']}\"",
									'placeholder'=>"placeholder=\"campaign name\"",
									'name'=>'name'
								))
							)
						);
						$campaign_html = '';
						foreach($campaign as $q)
							$campaign_html .= $q['html'];
						
						$view_params = array(
							'campaign_fields'=>$campaign_html,
							'campaign_buttons'=>$campaign_buttons,
							'campaign_details'=>$campaign_details,
							'scripts'=>array(
								'/js/cms/campaigns.js'=>10, 
								'https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js'=>5,
							)
						);
						
						if($errors)
							$view_params['errors'] = $errors;
						
						$this->load_view('campaign_edit', $view_params );
						

						break;
					case 'deactivate':

						break;
					case 'new_campaign':
						$campaign_id = content::create_new_campaign();
						
						view::redirect('/' . $this->app->get_config('tweed.admin_path') . "/campaign/edit/$campaign_id");
						break;
				}
				
				break;
		}
	}
	
	
	function login()
	{
		$app = \maverick\maverick::getInstance();
		
		if(isset($_POST['username']) && isset($_POST['password']))
		{
			$login = content::check_login($_POST['username'], $_POST['password']);
			
			if($login)
			{
				$_SESSION['maverick_login'] = true;
				$_SESSION['maverick_id'] = $login;
				
				$app = \maverick\maverick::getInstance();
				view::redirect('/' . $app->get_config('tweed.admin_path') . '/');
			}
		}
		
		$elements = '{
			"username":{"type":"text","label":"Username","validation":["required"]},
			"password":{"type":"password","label":"Password","validation":["required"]},
			"submit":{"type":"submit","value":"Login"}
		}';
		$form = new \helpers\html\form('login', $elements);
		$form->method = 'post';
		
		$view = view::make('includes/template_basic')->with('page', 'login')->with('login_form', $form->render() )->render();
	}
	
	/**
	 * clean up the list of passed in url parameters
	 * @param array $params the array of parameters to clean
	 * @return array
	 */
	function clean_params($params)
	{
		if(!$params)
			return false;
		
		foreach($params as $key => &$param)
		{
			$param = trim($param, '/');
			
			if($param == '')
				unset($params[$key]);
			
			if(strpos($param, '/'))
			{
				array_splice($params, $key, 1, explode('/', $param) );
			}
		}
		return $params;
	}
	
	/**
	 * checks the status of a user login and determines if it is valid
	 * @param array $params the URL params - used to prevent a redirect loop
	 * @return bool
	 */
	public static function check_login_status($params)
	{
		return !(!isset($_SESSION['maverick_login']) && $params[0] != 'login');
	}
	
	/**
	 * load in an admin view - this is basically a small wrapper to view::make(), it just adds in the admin nav and any other parameters passed into it
	 * this allows things to be added to all admin sections easily, in one method
	 * @param string $view the view to load - this is the same format as view::make()
	 * @param array $with_params any extra parameters that need to be passed in to this view
	 */
	protected function load_view($view, $with_params = array() )
	{
		// load scripts that need to be included on all pages and then sort them by their priority
		$global_scripts = array(
			'https://code.jquery.com/jquery-2.1.4.min.js' => 0,
		);
		if(!isset($with_params['scripts']))
			$with_params['scripts'] = array();
		
		$with_params['scripts'] = array_merge($with_params['scripts'], $global_scripts);
		$with_params['scripts'] = $this->sort_external_assets($with_params['scripts']);	// sort the assets by priority
		
		$view = view::make('includes/template')->with('page', $view)->with('admin_nav', $this->nav);
		
		foreach($with_params as $param => $value)
			$view->with($param, $value);
				
		$view->render();
	}
	
	/**
	 * sorts external assets (e.g. scripts, css) to ensure that they can be output in a sane order on the front-end
	 * returns a sorted list of assets
	 * @param array $assets an associative array of assets to sort, the key being the asset path, and the value being the priority value - lower values = more important
	 * @return array
	 */
	private function sort_external_assets($assets)
	{
		asort($assets);
		
		return $assets;
	}
}