default['datadog_notify'] = ['hipchat-Helios_Monitoring']
default['datadog_http_checks'] = [ 
	{ "name" => "app_name", "url" => "app_url" },
	{ "name" => "app_name_with_password", "url" => "app_url", "username" => "username", "password" => "password" }
	 ]
default['datadog_process_checks'] = [ 'process' ]