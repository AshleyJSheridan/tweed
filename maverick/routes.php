<?php
use maverick\route;

$app = \maverick\maverick::getInstance();

// admin routes
route::any("{$app->get_config('tweed.admin_path')}(/[^/]+)?(/.+)?", 'admin_controller->admin', array('$1', '$2') );
route::any("{$app->get_config('tweed.admin_path')}/login", 'admin_controller->login');
route::post("{$app->get_config('tweed.admin_path')}/tweets/(approve|unapprove)/([\d]+)", 'admin_controller->update_tweet_status', array('$1', '$2') );

route::get('campaigns', 'main_controller->get_campaigns');			// reserved for the cron to call
//route::any('update/([a-z0-9]+)', 'main_controller->update', '$1');	// reserved for the cron to call
route::any('get/([a-z0-9]+)', 'main_controller->get_tweets', '$1');		// the route for fetching tweets from the service by campaign

route::any('', 'main_controller->home');

route::error('404', 'error');
route::error('500', 'error');
