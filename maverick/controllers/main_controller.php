<?php
class main_controller extends base_controller
{
	function __construct() {}
	
	function get_tweets($campaign_hash)
	{
		$params = array(
			'total' => 'int',
			'page' => 'int',
			'lang' => array('regex', '/^[a-z]{2}$/'),
			'screen_name' => 'string',
			'since' => 'datetime',
			'before' => 'datetime',
			'reply' => array('regex', '/^(show|hide|only)$/'),
			'retweet' => array('regex', '/^(show|hide|only)$/'),
			'approved' => array('regex', '/^(yes|no)$/'),
			'format' => array('regex', '/^(json|html)$/'),
		);
		
		// normalise requested filter parameters to safe values - prevents attacks from input
		foreach($params as $param => $constraint)
		{
			$extra = null;
			
			if(is_array($constraint))
			{
				$extra = $constraint[1];
				$constraint = $constraint[0];
			}
			
			switch($constraint)
			{
				case 'int':
					$$param = (!empty($_REQUEST[$param]) && intval($_REQUEST[$param]) )?intval($_REQUEST[$param]):null;
					break;
				case 'regex':
					$$param = (!empty($_REQUEST[$param]) && preg_match($extra, $_REQUEST[$param]) )?$_REQUEST[$param]:null;
					break;
				case 'string':
					$$param = (!empty($_REQUEST[$param]) )?$_REQUEST[$param]:null;
					break;
				case 'bool':
					$$param = isset($_REQUEST[$param]);
					break;
				case 'datetime':
					$$param = (!empty($_REQUEST[$param]) && strtotime($_REQUEST[$param]) > -1)?strtotime($_REQUEST[$param]):null;	// the comparison with -1 instead of false is to allow compatibility with php 5.1.0
					break;
			}
		}
		
		$tweets = content::get_tweets($campaign_hash, $total, $page, $lang, $screen_name, $since, $before, $reply, $retweet, $approved);
		
		// throw an error if there are no tweets for some reason
		if(!is_array($tweets))
		{
			$headers = array(
				'content-type'=>'text/plain',
				'status'=>400,
			);
			view::make('errors/plain_error')->with('message', $tweets)->headers($headers)->render(true, true);
		}
		
		switch($format)
		{
			case 'html':
				// todo: pull in templates here that each tweet would be wrapped in - this is unspecced right now
				break;
			default:
				// json
				$headers = array(
					'content-type'=>'application/json',
				);
				view::make('json')->with('tweets', json_encode($tweets) )->headers($headers)->render(true, true);
				break;
		}
	}
	
	/**
	 * fetches tweets according to specific criteria
	 */
	function update($campaign_hash)
	{
		$get = content::fetch_tweets_from_twitter($campaign_hash);

	}
}