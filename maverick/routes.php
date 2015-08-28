<?php
use maverick\route;

route::get('admin', 'main_controller->admin');
route::any('login', 'main_controller->login');
route::any('update/([a-z0-9]+)', 'main_controller->update', '$1');	// reserved for the cron to call
route::any('get/([a-z0-9]+)', 'main_controller->get_tweets', '$1');		// the route for fetching tweets from the service
route::any('', 'main_controller->home');

route::error('404', 'error');
route::error('500', 'error');
