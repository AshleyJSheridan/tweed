<?php
use \maverick\db as db;
//use \Abraham\TwitterOAuth\TwitterOAuth;

class content
{

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

			$search = $connection->get('search/tweets', array('q'=>"#sxsw -2016", 'result_type'=>'recent', 'count'=>1, ) );

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
						'created_at' => $status->created_at,
						'content' => $status->text,
						'source' => $status->source,
						'in_reply_to_id' => $status->in_reply_to_user_id_str,
						'in_reply_to_screen_name' => $status->in_reply_to_screen_name,
						'retweet_count' => $status->retweet_count,
					);
					
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
					
					return (bool)$tweet_entities;
				}
			}
		}
		
	}
}