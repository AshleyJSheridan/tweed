<!DOCTYPE html>
<!--[if lt IE 7]>      <html lang="en" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html lang="en" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="en" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<meta charset="UTF-8"/>

	<title>Tweed</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

	<link href="http://fonts.googleapis.com/css?family=Lato&amp;subset=latin,latin-ext" rel="stylesheet" type="text/css"/>
	
	<link rel="stylesheet" href="/css/tweed.css">

	<?php
	$scripts = data::get('scripts');
	foreach($scripts as $script => $priority)
		echo "<script data-priority=\"$priority\" src=\"$script\"></script>";
	?>
</head>
	
<body class="">
	<header>
		<h1>Tweed</h1>
		<nav>
			<?php
			$var = "{{admin_nav}}";
			echo $var;
			?>
		</nav>
	</header>
	<section class="main">