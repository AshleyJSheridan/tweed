<?php
use maverick\route;

route::get('admin', 'main_controller->admin');
route::any('login', 'main_controller->login');
route::any('update/([a-z0-9]+)', 'main_controller->update', '$1');
route::any('', 'main_controller->get_tweets');

route::error('404', 'error');
route::error('500', 'error');
