<?php
class main_controller extends base_controller
{
	function __construct() {}
	
	function get_tweets()
	{
		echo 'tweets';
	}
	
	/**
	 * fetches tweets according to specific criteria
	 */
	function update($campaign_hash)
	{
		$get = content::fetch_tweets_from_twitter($campaign_hash);

	}
}