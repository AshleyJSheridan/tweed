<?php
use \maverick\data as data;

/**
 * the view class responsible for creating the final view to give to a controller
 */
class view
{
	static $_instance;
	private $view = '';
	private $data = array();
	private $headers = array();
	private $original_headers = array();	// the headers actually specified by the user, which may not actually be set if they are malformed, etc
	private $parse_handlers = array();
	
	private function __construct() {}
	
	private function __clone() {}
	
	/**
	 * return the singleton instance of this class - there can be only one!
	 * @return view
	 */
	public static function getInstance()
	{
		if(!(self::$_instance instanceof self))
			self::$_instance = new self;

		return self::$_instance;
	}

	/**
	 * reset the instance and set the view to use for this view instance
	 * @param string $view
	 * @return view
	 */
	public static function make($view)
	{
		$v = view::getInstance();
		$app = \maverick\maverick::getInstance();
		
		$v->reset();
		
		if(!strlen($view))
			error::show('View not specified');
		
		$v->set_view($view);
		$app->set_view($v);
		
		return $v;
	}
	
	/**
	 * set a named parameter to add to the main classes data array
	 * @param string $name the name by which to reference this data
	 * @param mixed $data the data to add
	 * @return view
	 */
	public static function with($name, $data)
	{
		$v = view::getInstance();
		
		if(!strlen($name) || empty($data))
			return $v;	// probably nicest to just return the view without modification so that it doesn't break the chain
		
		$v->data[$name] = $data;
		
		return $v;
	}
	
	/**
	 * add HTTP headers to this view
	 * depending on the header being added, certain restrictions may apply
	 * @param array $headers the headers to pass to the view
	 * @return view
	 */
	public static function headers($headers = array() )
	{
		$v = view::getInstance();

		if(!is_array($headers))
			return false;
		
		foreach($headers as $header => $value)
		{
			// try  to validate the values passed to the most commonly used headers set
			// the $header variable is converted to the correct case in most of these in-case
			// several headers share the same validation constraints - it's a neatness thing!
			switch($header)
			{
				case 'status':
					if(intval($value))
						$v->headers['status'] = $v->set_status_code($value);
					break;
				case 'content-type':
					if(preg_match('/^[a-z0-9]+\/[a-z0-9]+(; charset=.+)?$/', $value) )
						$v->headers[$header] = $v->convert_header_case($header) . ": $value";
					break;
				case 'content-disposition':
					if(preg_match('/^attachment; ?filename=["\'][^"\']+["\']$/', $value) )
						$v->headers[$header] = $v->convert_header_case($header) . ": $value";
					break;
				case 'cache-control':
					if(preg_match('/^(public|private|no-cache(, must-revalidate)?|no-store|max-age=\d+(, (public|private))?(, must-revalidate)?)$/' ,$value) )
						$v->headers[$header] = $v->convert_header_case($header) . ": $value";
					break;
				case 'pragma':
					if(preg_match('/^(cache|no-cache)$/', $value) )
						$v->headers[$header] = $v->convert_header_case($header) . ": $value";
					break;
				case 'expires':
				case 'last-modified':
					if($v->check_date($value) )
						$v->headers[$header] = $v->convert_header_case($header) . ": $value";
					break;
				case 'content-length':
					if(intval($value))
						$v->headers[$header] = $v->convert_header_case($header) . ": $value";
					break;
				default:
					$v->headers[$header] = $v->convert_header_case($header) . ": $value";
			}
			
			$v->original_headers[$header] = $value;	// make a record of the actual requested header, regardless of whether it was actually successfully added due to parsing rules
		}

		return $v;
	}
	
	/**
	 * adds a custom parse handler to a member array on the view object that can then be iterated
	 * to allow userland code to parse the rendered view and replace custom template snippets
	 * @param string $namespace the namespace given to a template snippet, e.g. {{namespace:
	 * @param string $handler a string in the form of controller->method, where method is the static method of the given controller which is used as the callback in preg_replace_callback() for the custom parser
	 * @return view
	 */
	public static function parse_handler($namespace, $handler)
	{
		if(!preg_match('/^\p{L}[\p{L}\p{N}_]+$/', $namespace) || !preg_match('/^\p{L}[\p{L}\p{N}_]+\-\>\p{L}[\p{L}\p{N}_]+$/', $handler) )
			return false;
		
		$v = view::getInstance();
		
		$v->parse_handlers[] = array($namespace, $handler);
		
		return $v;
	}
	
	/**
	 * use object buffering to build up the views into a single string and either return or echo it
	 * optionally output any headers that have been added to the view instance
	 * @param bool $echo whether to echo the view or return it as a string
	 * @param bool $with_headers if set to true and $echo is also set to true, then send headers to the browser, otherwise do nothing
	 * @return string
	 */
	public static function render($echo=true, $with_headers=false)
	{
		$v = view::getInstance();
		$app = \maverick\maverick::getInstance();
		
		$view_file_path = MAVERICK_VIEWSDIR . "/$v->view.php";

		if(!file_exists($view_file_path))
			error::show("View '$v->view' does not exist");
		else
		{
			ob_start();
			include $view_file_path;
			$view = ob_get_contents();
			ob_end_clean();

			if($app->get_config('config.view_parsing') !== false)
				$view = $v->parse_view($view);

			// this just stores the view if the config value is set to cache it
			if($app->get_config('cache.on') !== false)
			{
				$hash = $app->get_request_route_hash();
				\maverick\cache::store($hash, $view);
				
				if($with_headers)
					\maverick\cache::store("{$hash}_headers", json_encode($v->headers) );
			}
			
			if($with_headers)
			{
				foreach($v->headers as $header)
					header($header);
				
				// teapot
				if(isset($v->original_headers['status']) && $v->original_headers['status'] == 418 && $app->get_config('config.teapot') !== false)
				{
					$teapot = \helpers\html\html::load_snippet(\MAVERICK_BASEDIR . 'vendor/maverick/teapot.html', array() );
					$view = preg_replace('/<body/', "<body>$teapot", $view, 1);
					
				}
			}
			
			if($echo)
				echo $view;
			else
				return $view;
		}
	}
	
	/**
	 * perform a redirect and add in a response code if it was set
	 * @param string $url the URL to redirect to - although the specs say it has to be absolute, every browser accepts relative too
	 * @param int $response_code if a positive integer, this is the HTTP response code that is sent too
	 */
	public static function redirect($url, $response_code = null)
	{
		// set the host and protocol in order to validate relative URLs
		// note that any URL that does not begin with a protocol is considered relative, as per the spec
		$host = isset($_SERVER['HTTP_HOST'])?$_SERVER['HTTP_HOST']:$_SERVER['SERVER_NAME'];
		$protocol = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on')
			|| (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')
			|| (isset($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') )?'https://':'http://';

		// if the URL is not considered valid, even after treating it as relative and converting it to absolute, then just bomb out
		if(!filter_var($url, FILTER_VALIDATE_URL) && ! filter_var("{$protocol}$host/$url", FILTER_VALIDATE_URL) )
			return false;
		
		if($response_code && intval($response_code))
			header("Location: $url", true, $response_code);
		else
			header("Location: $url");
			
		exit;
	}
	
	/**
	 * get the contents of a variable in the data member array
	 * @param string $var the variable to return contents for
	 * @return mixed
	 */
	public function get_data($var)
	{
		$v = view::getInstance();
		
		return (isset($v->data[$var]))?$v->data[$var]:'';
	}
	
	/**
	 * parse the rendered view for {{placeholders}} and replace them
	 * @param string $view the rendered view (typically html) possibly containing {{placeholders}}
	 * @return string
	 */
	private function parse_view($view)
	{
		$v = view::getInstance();
		$app = \maverick\maverick::getInstance();
		
		// check for the use of multi-lingual gettext stuff
		if($app->get_config('lang.active') !== false)
		{
			// match the format of {{_('string to translate')}} - the quote style can be either single or double,
			// and the text to translate must start with a letter \p{L}
			if(preg_match_all('/\{\{_\(([\'"]\p{L}[^\'"]+[\'"])\)\}\}/', $view, $matches) && !empty($matches[1]) )
			{
				$find = $replace = array();
				
				foreach($matches[1] as $match)
				{
					$find[] = "{{_($match)}}";
					$replace[] = _(trim($match, "\"'") );
				}
				
				$view = str_replace($find, $replace, $view);
			}
		}
		// run any custom handlers that have been added - the callback will pass up to three matched parameters in the form
		// {{handler_namespacee:param1:param2:param3}} with each matched parameter being in an array with
		// param1 being array index 1, param2 being array index 3, and param3 being array index5
		// the callback method must be a static method, and the return must be a string
		if(count($v->parse_handlers))
		{
			foreach($v->parse_handlers as $parse_handler)
			{
				list($controller, $method) = explode('->', $parse_handler[1]);

				$view = preg_replace_callback("/\{\{{$parse_handler[0]}:([\p{L}\p{N}_]+)(:([\p{L}\p{N}_]+))?(:([\p{L}\p{N}_]+))?\}\}/", array($controller, $method), $view);
			}
		}
			
		// match simple placeholder formats - this check should always be last
		if(preg_match_all('/\{\{(\p{L}[\p{L}\p{N}_\.]+)/', $view, $matches) && !empty($matches[1]) )
		{
			$find = $replace = array();

			foreach($matches[1] as $match)
			{
				$find[] = "{{{$match}}}";

				$r = \data::get($match);
				if(is_array($r))
					$r = implode($r);

				$replace[] = $r;
			}

			$view = str_replace($find, $replace, $view);
		}
		
		
		return $view;
	}
	
	/**
	 * reset this singleton instance back to the beginning values
	 */
	private function reset()
	{
		// not everything needs to be reset, only those variables pertaining to an individual view
		$v = view::getInstance();
		
		foreach(array('view') as $var)
			$v->$var = '';
			
		foreach(array('data') as $var)
			$v->$var = array();
	}
	
	/**
	 * verify that a date string is in the correct format
	 * this is used to verify dates used in the headers
	 * @param string $date_string the date string to validate
	 * @return bool
	 */
	private function check_date($date_string)
	{
		$d = DateTime::createFromFormat('D, d M Y H:i:s e', $date_string);

		return $d && $d->format('D, d M Y H:i:s e') == $date_string;
	}
	
	/**
	 * convert a lowercase header to the correct capitalised case by casting to lower,
	 * breaking apart, and then capitalising, before joing together again
	 * @param string $header the header to convert the case for
	 * @return string
	 */
	private function convert_header_case($header)
	{
		return implode('-', array_map('ucfirst', explode('-', strtolower($header) ) ) );
	}
	
	/**
	 * set the full status code from an HTTP status code
	 * @param int $code the HTTP status code
	 * @return string
	 */
	private function set_status_code($code)
	{
		$codes = array(
			100 => 'Continue',
			101 => 'Switching Protocols',
			102 => 'Processing',
			200 => 'OK',
			201 => 'Created',
			202 => 'Accepted',
			203 => 'Non-Authoritative Information',
			204 => 'No Content',
			205 => 'Reset Content',
			206 => 'Partial Content',
			207 => 'Multi-Status',
			208 => 'Already Reported',
			209 => 'IM Used',
			301 => 'Moved Permanently',
			302 => 'Found',
			303 => 'See Other',
			304 => 'Not Modified',
			305 => 'Use Proxy',
			306 => 'Switch Proxy',
			307 => 'Temporary Redirect',
			308 => 'Permanent Redirect',
			400 => 'Bad Request',
			401 => 'Unauthorized',
			402 => 'Payment Required',
			403 => 'Forbidden',
			404 => 'Not Found',
			405 => 'Method Not Allowed',
			406 => 'Not Acceptable',
			407 => 'Proxy Authentication Required',
			408 => 'Request Timeout',
			409 => 'Conflict',
			410 => 'Gone',
			411 => 'Length Required',
			412 => 'Precondition Failed',
			413 => 'Request Entity Too Large',
			414 => 'Request-URI Too Long',
			415 => 'Unsupported Media Type',
			416 => 'Requested Range Not Satisfiable',
			417 => 'Expectation Failed',
			418 => 'I\'m a teapot',
			419 => 'Authentication Timeout',
			420 => 'Method Failure',
			421 => 'Enhance Your Calm',
			422 => 'Unprocessable Entity',
			423 => 'Locked',
			424 => 'Failed Dependency',
			426 => 'Upgrade Required',
			428 => 'Precondition Required',
			429 => 'Too Many Requests',
			431 => 'Request Header Fields Too Large',
			440 => 'Login Timeout',
			444 => 'No Response',
			449 => 'Retry With',
			450 => 'Blocked by Windows Parental Controls',
			451 => 'Unavailable For Legal Reasons',
			494 => 'Request Header Too Large',
			495 => 'Cert Error',
			496 => 'No Cert',
			497 => 'HTTP to HTTPS',
			498 => 'Token expired/invalid',
			499 => 'Client Closed Request',
			500 => 'Internal Server Error',
			501 => 'Not Implemented',
			502 => 'Bad Gateway',
			503 => 'Service Unavailable',
			504 => 'Gateway Timeout',
			505 => 'HTTP Version Not Supported',
			506 => 'Variant Also Negotiates',
			507 => 'Insufficient Storage',
			508 => 'Loop Detected',
			509 => 'Bandwidth Limit Exceeded',
			510 => 'Not Extended',
			511 => 'Network Authentication Required',
			598 => 'Network read timeout error',
			599 => 'Network connect timeout error',
 		);
		
		if(isset($codes[$code]))
			return "{$_SERVER["SERVER_PROTOCOL"]} $code {$codes[$code]}";
		else
			return $this->set_status_code (200);
	}

	/**
	 * set the view to use on this instance
	 * @param string $view the view to use
	 */
	private function set_view($view)
	{
		$this->view = $view;
	}
}