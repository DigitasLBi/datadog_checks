service "datadog-agent" do
	action [:enable, :start]
end

node.default[:datadog_process_checks] = [ "mongod" ]
node.default['datadog_http_checks'] = []

template "/etc/dd-agent/conf.d/mongo.yaml" do 
	source "mongo.yaml.erb"
	action :create
	variables({
     :notify => node[:datadog_notify]
    })
  	notifies :restart, "service[datadog-agent]", :delayed
end

include_recipe "datadog_checks::default"