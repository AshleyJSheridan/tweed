#MaVeriCk
![MaVeriCk Logo](https://raw.githubusercontent.com/AshleyJSheridan/maverick/master/docs/img/large_w600.png)

MaVeriCk is a lightweight PHP MVC framework, that comes with the typical features required for small websites:

The features of this framework include:

* Versatile config across multiple files - so you can split the DB config from your validation error messages, etc.
* Class autoloading - don't worry about everything being included at the beginning of your code, and load only what you use, including PSR0 classes
* Versatile routing based on the type of request. You don't want to load in the validator the first time you display a form page, only once it's been submitted, so you can split your GET and POST requests right at the start
* Route pre-parsing to analyse and modify the URL as required before routing by using extended class methods
* Powerful DB abstraction layer based loosely on the ActiveRecord pattern - allowing for complicated queries to be built in an object orientated manner, and queries will be properly parameterised
* Powerful form validation based on arrays of rules, based a little on the concept behind triggering validation rules in [Laravel](http://laravel.com/).
* i18n language culture capabilities so you can implement multiple languages across your application with ease
* Simple views that you can chain as many extra parameters to as you want
* A basic templating language that allows extra class methods to be added to extend the parsing functionlity
* Helper classes for building forms and generating/manipulating images
* Caching capabilities that can use either APC or file-based caches

Detailed documentation is available in [the GitHub wiki for this project](https://github.com/AshleyJSheridan/maverick/wiki)