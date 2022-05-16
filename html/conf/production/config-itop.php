<?php

/**
 *
 * Configuration file, generated by the iTop configuration wizard
 *
 * The file is used in MetaModel::LoadConfig() which does all the necessary initialization job
 *
 */
$MySettings = array(

	// access_message: Message displayed to the users when there is any access restriction
	//	default: 'iTop is temporarily frozen, please wait... (the admin team)'
	'access_message' => 'iTop is temporarily frozen, please wait... (the admin team)',

	// access_mode: Access mode: ACCESS_READONLY = 0, ACCESS_ADMIN_WRITE = 2, ACCESS_FULL = 3
	//	default: 3
	'access_mode' => 3,

	// activity_panel.entry_form_opened_by_default: Whether or not the new entry form will be automatically opened when viewing an object.
	//	default: false
	'activity_panel.entry_form_opened_by_default' => false,

	// activity_panel.show_author_name_below_entries: Whether or not to show the author friendlyname next to the date on the last entry.
	//	default: false
	'activity_panel.show_author_name_below_entries' => false,

	'allowed_login_types' => 'form|basic|external',

	// apc_cache.enabled: If set, the APC cache is allowed (the PHP extension must also be active)
	//	default: true
	'apc_cache.enabled' => true,

	// apc_cache.query_ttl: Time to live set in APC for the prepared queries (seconds - 0 means no timeout)
	//	default: 3600
	'apc_cache.query_ttl' => 3600,

	// app_root_url: Root URL used for navigating within the application, or from an email to the application (you can put $SERVER_NAME$ as a placeholder for the server's name)
	//	default: ''
	'app_root_url' => 'https://' . getenv('HOST') . ':4430/',

	// behind_reverse_proxy: If true, then proxies custom header (X-Forwarded-*) are taken into account. Use only if the webserver is not publicly accessible (reachable only by the reverse proxy)
	//	default: false
	'behind_reverse_proxy' => false,

	// buttons_position: Deprecated since 3.0.0, buttons are now always on top of the form.
	//	default: 'both'
	'buttons_position' => 'both',

	// cas_include_path: Deprecated, the lib is now included with iTop
	//	default: ''
	'cas_include_path' => '/usr/share/php',

	// cron_max_execution_time: Duration (seconds) of the page cron.php, must be shorter than php setting max_execution_time and shorter than the web server response timeout
	//	default: 600
	'cron_max_execution_time' => 600,

	// csv_file_default_charset: Character set used by default for downloading and uploading data as a CSV file. Warning: it is case sensitive (uppercase is preferable).
	//	default: 'ISO-8859-1'
	'csv_file_default_charset' => 'ISO-8859-1',

	'csv_import_charsets' => array (
	),

	// csv_import_history_display: Display the history tab in the import wizard
	//	default: false
	'csv_import_history_display' => false,

	// date_and_time_format: Format for date and time display (per language)
	//	default: array (
	//		  'default' => 
	//		  array (
	//		    'date' => 'Y-m-d',
	//		    'time' => 'H:i:s',
	//		    'date_time' => '$date $time',
	//		  ),
	//		)
	'date_and_time_format' => array('default' => array('date' => 'Y-m-d', 'time' => 'H:i:s', 'date_time' => '$date $time')),

	'db_host' => 'mysql',

	'db_name' => getenv('MYSQL_DATABASE'),

	'db_pwd' => getenv('MYSQL_PASSWORD'),

	'db_subname' => '',

	'db_user' => getenv('MYSQL_USER'),

	// deadline_format: The format used for displaying "deadline" attributes: any string with the following placeholders: $date$, $difference$
	//	default: '$difference$'
	'deadline_format' => '$difference$',

	'default_language' => 'EN US',

	// email_asynchronous: If set, the emails are sent off line, which requires cron.php to be activated. Exception: some features like the email test utility will force the serialized mode
	//	default: false
	'email_asynchronous' => false,

	// email_default_sender_address: Default address provided in the email from header field.
	//	default: ''
	'email_default_sender_address' => '',

	// email_default_sender_label: Default label provided in the email from header field.
	//	default: ''
	'email_default_sender_label' => '',

	// email_transport: Mean to send emails: PHPMail (uses the function mail()) or SMTP (implements the client protocol)
	//	default: 'PHPMail'
	'email_transport' => 'SMTP',

	// email_transport_smtp.host: host name or IP address (optional)
	//	default: 'localhost'
	'email_transport_smtp.host' => getenv('EMAIL_HOST'),

	// email_transport_smtp.port: port number (optional)
	//	default: 25
	'email_transport_smtp.port' => getenv('EMAIL_PORT'),

	// email_validation_pattern: Regular expression to validate/detect the format of an eMail address
	//	default: '[a-zA-Z0-9._&\'-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z0-9-]{2,}'
	'email_validation_pattern' => '[a-zA-Z0-9._&\'-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z0-9-]{2,}',

	'encryption_key' => '@iT0pEncr1pti0n!',

	'encryption_library' => 'Sodium',

	'ext_auth_variable' => '$_SERVER[\'REMOTE_USER\']',

	'fast_reload_interval' => '60',

	// graphviz_path: Path to the Graphviz "dot" executable for graphing objects lifecycle
	//	default: '/usr/bin/dot'
	'graphviz_path' => '/usr/bin/dot',

	// high_cardinality_classes: List of classes with high cardinality (Force manual submit of search)
	//	default: array (
	//		)
	'high_cardinality_classes' => array(),

	// inline_image_max_display_width: The maximum width (in pixels) when displaying images inside an HTML formatted attribute. Images will be displayed using this this maximum width.
	//	default: '250'
	'inline_image_max_display_width' => 250,

	// inline_image_max_storage_width: The maximum width (in pixels) when uploading images to be used inside an HTML formatted attribute. Images larger than the given size will be downsampled before storing them in the database.
	//	default: '1600'
	'inline_image_max_storage_width' => 1600,

	// link_set_attribute_qualifier: Link set from string: attribute qualifier (encloses both the attcode and the value)
	//	default: '\''
	'link_set_attribute_qualifier' => '\'',

	// link_set_attribute_separator: Link set from string: attribute separator
	//	default: ';'
	'link_set_attribute_separator' => ';',

	// link_set_item_separator: Link set from string: line separator
	//	default: '|'
	'link_set_item_separator' => '|',

	// link_set_value_separator: Link set from string: value separator (between the attcode and the value itself
	//	default: ':'
	'link_set_value_separator' => ':',

	'log_global' => true,

	'log_issue' => true,

	'log_notification' => true,

	// log_usage: Log the usage of the application (i.e. the date/time and the user name of each login)
	//	default: false
	'log_usage' => true,

	'log_web_service' => true,

	'max_display_limit' => '15',

	// max_linkset_output: Maximum number of items shown when getting a list of related items in an email, using the form $this->some_list$. 0 means no limit.
	//	default: 100
	'max_linkset_output' => 100,

	// mentions.allowed_classes: Classes which can be mentioned through the autocomplete in the caselogs. Key of the array must be a single character that will trigger the autocomplete, value must be a DM class (eg. "@" => "Person", "?" => "FAQ")
	//	default: array (
	//		  '@' => 'Person',
	//		)
	'mentions.allowed_classes' => array('@' => 'Person'),

	'min_display_limit' => '10',

	// online_help: Hyperlink to the online-help web page
	//	default: 'http://www.combodo.com/itop-help'
	'online_help' => 'http://www.combodo.com/itop-help',

	// optimize_requests_for_join_count: Optimize request joins to minimize the count (default is true, try to set it to false in case of performance issues)
	//	default: true
	'optimize_requests_for_join_count' => true,

	'password_hash_algo' => '2y',

	// php_path: Path to the php executable in CLI mode
	//	default: 'php'
	'php_path' => 'php',

	// query_cache_enabled: If set, DBSearch will use cache for query generation
	//	default: true
	'query_cache_enabled' => true,

	// search_manual_submit: Force manual submit of search all requests
	//	default: false
	'search_manual_submit' => false,

	'secure_connection_required' => false,

	// session_name: The name of the cookie used to store the PHP session id
	//	default: 'iTop'
	'session_name' => 'iTop',

	// shortcut_actions: Actions that are available as direct buttons next to the "Actions" menu
	//	default: 'UI:Menu:Modify,UI:Menu:New'
	'shortcut_actions' => 'UI:Menu:Modify,UI:Menu:New',

	// source_dir: Source directory for the datamodel files. (which gets compiled to env-production).
	//	default: ''
	'source_dir' => 'datamodels/2.x/',

	'standard_reload_interval' => '300',

	// synchro_trace: Synchronization details: none, display, save (includes 'display')
	//	default: 'none'
	'synchro_trace' => 'none',

	// tag_set_item_separator: Tag set from string: tag label separator
	//	default: '|'
	'tag_set_item_separator' => '|',

	// timezone: Timezone (reference: http://php.net/manual/en/timezones.php). If empty, it will be left unchanged and MUST be explicitly configured in PHP
	//	default: 'Europe/Paris'
	'timezone' => 'Europe/Budapest',

	// url_validation_pattern: Regular expression to validate/detect the format of an URL (URL attributes and Wiki formatting for Text attributes)
	//	default: '(https?|ftp)\\://([a-zA-Z0-9+!*(),;?&=\\$_.-]+(\\:[a-zA-Z0-9+!*(),;?&=\\$_.-]+)?@)?([a-zA-Z0-9-.]{3,})(\\:[0-9]{2,5})?(/([a-zA-Z0-9:%+\\$_-]\\.?)+)*/?(\\?[a-zA-Z+&\\$_.-][a-zA-Z0-9;:[\\]@&%=+/\\$_.-]*)?(#[a-zA-Z_.-][a-zA-Z0-9+\\$_.-]*)?'
	'url_validation_pattern' => '(https?|ftp)\\://([a-zA-Z0-9+!*(),;?&=\\$_.-]+(\\:[a-zA-Z0-9+!*(),;?&=\\$_.-]+)?@)?([a-zA-Z0-9-.]{3,})(\\:[0-9]{2,5})?(/([a-zA-Z0-9%+\\$_-]\\.?)+)*/?(\\?[a-zA-Z+&\\$_.-][a-zA-Z0-9;:[\\]@&%=+/\\$_.-]*)?(#[a-zA-Z_.-][a-zA-Z0-9+\\$_.-]*)?',
);

/**
 *
 * Modules specific settings
 *
 */
$MyModuleSettings = array(
	'authent-ldap' => array (
		'host' => '192.168.1.2',
		'default_user' => 'vertis\\itop',
		'default_pwd' => 'Sz1m4tsz4ty0r',
		'base_dn' => 'DC=vertis,DC=local',
		'user_query' => '(|(&(samaccountname=%1$s)(objectCategory=User))(&(userprincipalname=%1$s)(objectCategory=User)))',
		'options' => array (
		  17 => 3,
		  8 => 0,
		),
		'start_tls' => false,
		'debug' => false,
		'port' => 389,
		'servers' => array (
		),
	),
	'email-reply' => array (
		'enabled_default' => true,
	),
	'itop-attachments' => array (
		'allowed_classes' => array (
		  0 => 'Ticket',
		),
		'position' => 'relations',
		'preview_max_width' => 290,
		'icon_preview_max_size' => 500000,
	),
	'authent-cas' => array (
		'cas_debug' => false,
		'cas_host' => '',
		'cas_port' => '',
		'cas_context' => '',
		'cas_version' => '',
	),
	'itop-backup' => array (
		'mysql_bindir' => '',
		'week_days' => 'monday, tuesday, wednesday, thursday, friday',
		'time' => '23:30',
		'retention_count' => 5,
		'enabled' => true,
		'itop_backup_incident' => '',
	),
);

/**
 *
 * Data model modules to be loaded. Names are specified as relative paths
 *
 */
$MyModules = array(
	'addons' => array('user rights' => 'addons/userrights/userrightsprofile.class.inc.php'),
);
?>