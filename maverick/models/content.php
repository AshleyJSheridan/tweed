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
	 * @param string $approved	yes or no, show only approved or include non-approved tweets
	 */
	static function get_tweets($campaign_hash, $total, $page, $lang, $screen_name, $since, $before, $reply, $retweet, $approved)
	{
		$app = \maverick\maverick::getInstance();
		
		$campaign = db::table('campaigns')
			->where('campaign_hash', '=', db::raw($campaign_hash))
			->get()
			->fetch();
		
		if(!empty($campaign[0]['id']) )
		{
			$campaign_id = $campaign[0]['id'];
			$total = ($total)?$total:$app->get_config('twitter.total');
			$offset = ($page)?($page-1)*$total:0;
			
			$tweets = db::table('tweets')
				->where('campaign_id', '=', db::raw($campaign_id) )
				->limit($total, $offset)
				->orderBy('created_at', 'desc')
				;
			
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
						$tweets = $tweets->where('in_reply_to_id', '!=', db::raw(null) );
						break;
					case 'only':
						$tweets = $tweets->where('in_reply_to_id', '=', db::raw(null) );
						break;
				}
			}
			if($retweet)
			{
				switch($reply)
				{
					case 'hide':
						$tweets = $tweets->where('retweet_count', '=', db::raw(0) );
						break;
					case 'only':
						$tweets = $tweets->where('in_reply_to_id', '>', db::raw(0) );
						break;
				}
			}

			
			// get the tweets
			$tweets = $tweets->get()->fetch();
			
			var_dump($tweets);
			exit;
		}
		else
			return 'Campaign does not exist';
	}
}