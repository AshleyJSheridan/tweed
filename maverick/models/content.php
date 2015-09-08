<?php
use \maverick\db as db;
//use \Abraham\TwitterOAuth\TwitterOAuth;

class content
{
	/**
	 * fetch the tweets from Twitter using the specified query params in the DB
	 * the query params are specific to the passed in hash
	 * @param string $campaign_hash the md5 hash of the campaign
	 */
	static function fetch_tweets_from_twitter($campaign_hash)
	{
		$app = \maverick\maverick::getInstance();
		
		$queries = db::table('campaigns AS c')
			->leftJoin('queries AS q', array('c.id', '=', 'q.campaign_id') )
			->where('c.campaign_hash', '=', db::raw($campaign_hash) )
			->get(array('c.id', 'c.name', 'c.url', 'q.type', 'q.content') )
			->fetch();

		// build up the query
		if(count($queries))
		{
			$campaign_id = $queries[0]['id'];
			
			$q_parts = array();
			foreach($queries as $q)
			{
				switch($q['type'])
				{
					case 'or':
						$q_parts[] = "OR {$q['content']}";
						break;
					case 'not':
						$q_parts[] = "-{$q['content']}";
						break;
					case 'hashtag':
						$q_parts[] = "#{$q['content']}";
						break;
					case 'to':
						$q_parts[] = "to:{$q['content']}";
						break;
					case 'from':
						$q_parts[] = "from:{$q['content']}";
						break;
					case 'at':
						$q_parts[] = "@{$q['content']}";
						break;
					case 'question':
						$q_parts[] = '?';
						break;
					default:
						// ands and sentiment as the latter two will have their respective values in the content field
						$q_parts[] = $q['content'];
				}
			}
			$query = implode(' ', $q_parts);
			
			// https://twitteroauth.com/
			$connection = new \Abraham\TwitterOAuth\TwitterOAuth($app->get_config('twitter.consumer_key'), $app->get_config('twitter.consumer_secret'), $app->get_config('twitter.access_token'), $app->get_config('twitter.access_token_secret') );

			$search = $connection->get('search/tweets', array('q'=>"#sxsw -2016", 'result_type'=>'recent', 'count'=>100, ) );

			if(!empty($search->statuses))
			{
				foreach($search->statuses as $status)
				{
					$data = array(
						'campaign_id' => $campaign_id,
						'iso_lang' => $status->lang,
						'user_id' => $status->user->id_str,
						'user_name' => $status->user->name,
						'user_screen_name' => $status->user->screen_name,
						'user_location' => $status->user->location,
						'tweet_id' => $status->id_str,
						'created_at' => date("Y-m-d H:i:s", strtotime($status->created_at) ),
						'content' => (!empty($status->retweeted_status) )?$status->retweeted_status->text:$status->text,
						'source' => $status->source,
						'in_reply_to_id' => $status->in_reply_to_user_id_str,
						'in_reply_to_screen_name' => $status->in_reply_to_screen_name,
						'retweet_count' => $status->retweet_count,
					);
					var_dump($status);
					$tweet_id = db::table('tweets')
						->insert($data)
						->fetch();
					
					$data = array();
					foreach(array('hashtags', 'urls', 'media') as $entity_type)
					{
						if(!empty($status->entities->$entity_type) )
						{
							foreach($status->entities->$entity_type as $entity)
							{
								$data[] = array(
									'tweet_id' => $tweet_id,	// update with result from above insert
									'entity_type' => rtrim($entity_type, 's'),	// removes the trailing 's' from the entity_type name
									'content' => ($entity_type == 'hashtag')?$entity->text:null,
									'url' => ($entity_type == 'urls')?$entity->expanded_url:(($entity_type == 'media')?$entity->media_url_https:null),
								);
							}
						}
					}
					$tweet_entities = db::table('tweet_entities')
						->insert($data)
						->fetch();
				}
			}
		}
		
	}
	
	/**
	 * retrieve tweets for display from the db that match the passed in campaign hash
	 * @param string $campaign_hash the hash for this campaign
	 * @param int $total the total number of results to return
	 * @param int $page the page of results to return
	 * @param string $lang the 2-character ISO language code
	 * @param string $screen_name the screen name of a user to retrieve tweets for
	 * @param int $since timestamp determining when to return tweets from
	 * @param int $before timestamp determining when to return tweets until
	 * @param string $reply show, hide, or only - determines if the list will contain, not contain or consist only of, replies
	 * @param string $retweet show, hide, or only - determines if the list will contain, not contain or consist only of, retweets
	 * @param string $approved yes or no, show only approved or include non-approved tweets
	 */
	static function get_tweets($campaign_hash, $total, $page, $lang, $screen_name, $since, $before, $reply, $retweet, $approved)
	{
		$app = \maverick\maverick::getInstance();
		
		// this check makes sure that the campaign hash sent belongs to a campaign
		// if null is sent then this will get all tweets as it's a call from the admin section
		if(!is_null($campaign_hash) )
		{
			$campaign = db::table('campaigns')
				->where('campaign_hash', '=', db::raw($campaign_hash))
				->get()
				->fetch();
			
			if(empty($campaign[0]['id']))
				return 'Campaign does not exist';
		}
		
		$total = ($total)?$total:$app->get_config('twitter.total');
		$offset = ($page)?($page-1)*$total:0;
		$tweets = db::table('tweets AS t')
			->leftJoin('campaigns AS c', array('c.id', '=', 't.campaign_id') )
			//->where('campaign_id', '=', db::raw($campaign[0]['id']) )
			->limit($total, $offset)
			->orderBy('created_at', 'desc')
			;
		
		// if the campaign hash was sent and maps to a valid id, then make that part of the where clause
		if(!empty($campaign[0]['id']) )
			$tweets = $tweets->where('campaign_id', '=', db::raw($campaign[0]['id']) );
		

		// filter by any additional parameters which are not null or false
		if($lang)
			$tweets = $tweets->where('iso_lang', '=', db::raw ($lang) );
		if($screen_name)
			$tweets = $tweets->where('user_screen_name', '=', db::raw ($screen_name) );
		if($since)
			$tweets = $tweets->where('created_at', '>', db::raw (date("Y-m-d H:i:s", $since) ) );
		if($before)
			$tweets = $tweets->where('created_at', '<', db::raw (date("Y-m-d H:i:s", $before) ) );
		if($reply)
		{
			switch($reply)
			{
				case 'hide':
					$tweets = $tweets->where('in_reply_to_id', '=', db::raw('0') );
					break;
				case 'only':
					$tweets = $tweets->where('in_reply_to_id', '>', db::raw('0') );
					break;
			}
		}
		if($retweet)
		{
			switch($retweet)
			{
				case 'hide':
					$tweets = $tweets->where('retweet_count', '=', db::raw('0') );
					break;
				case 'only':
					$tweets = $tweets->where('retweet_count', '>', db::raw('0') );
					break;
			}
		}


		// get the tweets
		$tweets = $tweets->get(array('t.*', 'c.name AS campaign_name'))->fetch();

		return $tweets;
		
	}
	
	static function update_tweet_status($tweet_id, $approved)
	{
		$updated = db::table('tweets')
			->where('id', '=', db::raw($tweet_id) )
			->update(array('approved'=>$approved) );
		
		return (bool)$updated;
	}
	
	/**
	 * determines if a username and password is valid - this does not presume any particular type of user, just a valid user
	 * @param string $username the username of the user to determine
	 * @param string $password the password for the user
	 * @return int|bool false if the user is not valid, or the id of the user otherwise
	 */
	static function check_login($username, $password)
	{
		$data = db::table('users')
			->where('username', '=', db::raw($username) )
			->where('password', '=', db::raw(md5($username . $password) ) )
			->get()
			->fetch();
		return(isset($data[0])?(int)$data[0]['id']:false );
	}
	
	static function get_all_campaigns()
	{
		$campaigns = db::table('campaigns AS c')
			->leftJoin('queries AS q', array('q.campaign_id', '=', 'c.id') )
			->leftJoin('users AS u', array('u.id', '=', 'c.created_by') )
			->leftJoin('users AS u2', array('u2.id', '=', 'c.modified_by') )
			->groupBy('c.id')
			->get(array('c.id', 'c.name', 'c.start', 'c.end', 'c.last_used', 'COUNT(q.id) AS query_params', 'u.username AS created_by', 'u2.username AS modified_by', 'c.force_deactivated') )
			->fetch()
			;
		
		return $campaigns;
	}
	
	static function get_campaign($campaign_id)
	{
		$campaign = db::table('campaigns AS c')
			->leftJoin('queries AS q', array('q.campaign_id', '=', 'c.id') )
			->where('c.id', '=', db::raw($campaign_id) )
			->orderBy('c.id')
			->orderBy('q.id')
			->get(array('c.id', 'c.name', 'c.url', 'c.start', 'c.end', 'c.force_deactivated', 'q.id AS qid', 'q.type', 'q.content', 'q.item_order') )
			->fetch();

		foreach($campaign as &$q)
		{
			// build the elements to go in the query block
			$type_options = array();
			foreach(array('and', 'at', 'from', 'hashtag', 'not', 'or', 'question') as $type)
			{
				$type_options[] = \helpers\html\html::load_snippet(MAVERICK_BASEDIR . 'vendor/helpers/html/snippets/input_option.php', array(
					'selected' => ($type == $q['type'])?'selected="selected"':'',
					'value' => $type,
					'display_value' => $type,
				));
			}
			$q['type_element'] = \helpers\html\html::load_snippet(MAVERICK_BASEDIR . 'vendor/helpers/html/snippets/label_wrap.php', array(
				'label'=>'Type',
				'element'=>\helpers\html\html::load_snippet(MAVERICK_BASEDIR . 'vendor/helpers/html/snippets/input_select.php', array(
						'name' => 'type[]',
						'values' => implode('', $type_options),
					))
				)
			);
			$q['content_element'] = \helpers\html\html::load_snippet(MAVERICK_BASEDIR . 'vendor/helpers/html/snippets/label_wrap.php', array(
				'label'=>'Content',
				'element'=>\helpers\html\html::load_snippet(MAVERICK_BASEDIR . 'vendor/helpers/html/snippets/input_text.php', array(
						'name' => 'content[]',
						'value' => "value=\"{$q['content']}\"",
						'placeholder' => 'placeholder="search text"',
					))
				)
			);
			$q['item_order_element'] = \helpers\html\html::load_snippet(MAVERICK_BASEDIR . 'vendor/helpers/html/snippets/input_number.php', array(
				'name' => 'item_order[]',
				'value' => "value=\"{$q['item_order']}\"",
			));
			
			// build the query block
			$q['html'] = \helpers\html\html::load_snippet(MAVERICK_VIEWSDIR . 'includes/snippets/query.php', $q);

		}
		
		return $campaign;
	}
	
	static function update_campaign($campaign_id)
	{
		$updated = db::table('campaigns')
			->where('id', '=', db::raw($campaign_id) )
			->update(array(
				'name' => db::raw($_REQUEST['name']),
				'url' => db::raw($_REQUEST['url']),
				'start' => db::raw($_REQUEST['start']),
				'end' => db::raw($_REQUEST['end']),
				'force_deactivated' => db::raw($_REQUEST['force_deactivated']),
				'modified_by' => $_SESSION['maverick_id'],
			));
		
		if($updated)
		{
			// remove the existing campaign queries for this campaign and add in the new ones
			// this is easier than trying to update existing ones and accounting for any change in the number of queries
			
			$deleted = db::table('queries')
				->where('campaign_id', '=', db::raw($campaign_id) )
				->delete();
			
			$query_data = array();
			
			for($i=0; $i<count($_REQUEST['type']); $i++ )
			{
				// ignore anything that isn't a valid type
				if(
					in_array($_REQUEST['type'][$i], array('and', 'at', 'from', 'hashtag', 'not', 'or', 'question') )
					&& !empty($_REQUEST['content'][$i])
					&& isset($_REQUEST['item_order'][$i])
					&& intval($_REQUEST['item_order'][$i])
				)
				{
					$query_data[] = array(
						'campaign_id' => $campaign_id,
						'type' => $_REQUEST['type'][$i],
						'content' => $_REQUEST['content'][$i],
						'item_order' => $_REQUEST['item_order'][$i],
					);
				}
			}
			$insert = db::table('queries')
				->insert($query_data);
		}
	}
	
	static function create_new_campaign()
	{
		$campaign_name = 'new campaign ' . date("y-m-d H:i");
		
		$campaign_id = db::table('campaigns')
			->insert(array(
				'name' => $campaign_name,
				'campaign_hash' => md5($campaign_name),
				'start' => date("Y-m-d"),
				'end' => date("Y-m-d"),
				'created_by'=>$_SESSION['maverick_id'],
				'modified_by'=>$_SESSION['maverick_id'],
				'force_deactivated'=>'yes',
			))
			->fetch();
		
		$query = db::table('queries')
			->insert(array(
				'campaign_id' => $campaign_id,
				'type' => 'and',
				'content' => 'test',
				'item_order' => 1,
			))
			->fetch();
		
		return $campaign_id;
	}
	
	static function set_campaign_status($campaign_id, $change)
	{
		$change = ($change == 'deactivate')?'yes':'no';
		
		$updated = db::table('campaigns')
			->where('id', '=', db::raw($campaign_id) )
			->update(array('force_deactivated' => $change) );
		
		return (bool)$updated;
	}

	/**
	 * deals with the creation of action buttons (links) used throughout the CMS to do something
	 * @param string $section the section, as all links will contain this in their URL
	 * @param int $id the ID of the object being worked on
	 * @param array $actions a basic single dimensional array of single-word actions, that go into the URL and the text of the link
	 * @param string $extra_classes a string of extra classes that should be added to each button
	 * @param string $type the type of element to use, either a button or a link
	 * @return string
	 */
	static function generate_actions($section, $id, $actions = array(), $extra_classes='', $type='link')
	{
		if(empty($actions) || empty($section) )
			return '';

		$app = \maverick\maverick::getInstance();
		
		$type = in_array($type, array('link', 'button') )?$type:'link';
		
		$actions_html = '';
		foreach($actions as $action)
		{
			$replacements = array(
				'href' => str_replace(' ', '_', "/{$app->get_config('tweed.admin_path')}/$section/$action/$id"),
				'action' => $action,
				'id' => $id,
				'section' => $section,
				'class' => str_replace(' ', '_', $action) . " $extra_classes",
			);
			$actions_html .= \helpers\html\html::load_snippet(MAVERICK_VIEWSDIR . "includes/snippets/action_$type.php", $replacements );
		}
		return $actions_html;
	}
}