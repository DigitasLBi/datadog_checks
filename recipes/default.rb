service "datadog-agent" do
	action [:enable, :start]
end

directory '/etc/dd-agent' do
	action :create
end

directory '/etc/dd-agent/conf.d' do
	action :create
end

template "/etc/dd-agent/conf.d/http_check.yaml" do 
	source "http_check.yaml.erb"
	action :create
	variables({
     :notify => node[:datadog_notify],
     :instances => node[:datadog_http_checks]
  	})
  	notifies :restart, "service[datadog-agent]", :delayed
  	not_if {node[:datadog_http_checks].empty?} 
end

template "/etc/dd-agent/conf.d/process.yaml" do 
	source "process.yaml.erb"
	action :create
	variables({
     :notify => node[:datadog_notify],
     :instances => node[:datadog_process_checks]
  	})
  	notifies :restart, "service[datadog-agent]", :delayed
  	not_if {node[:datadog_process_checks].empty?}
end