<?php
$app = \maverick\maverick::getInstance();

$nav = array(
	'' => 'Home',
	'/tweets' => 'Tweets',
);

if(isset($_SESSION['maverick_login']) && $_SESSION['maverick_login'])
	$nav['/logout'] = 'Logout';

$params = data::get('params');
$request = isset($params[0])?$params[0]:'';

foreach($nav as $uri => $name)
{
	$active = trim($uri, '/') == $request?'active':'';
	$class = strtolower(str_replace('_', '', $name));
	$uri = '/' . $app->get_config('tweed.admin_path') . $uri;
	echo <<<NAV
	<a href="$uri" class="$class $active">$name</a>
NAV;
}