require 'spec_helper'

describe 'datadog_checks::default' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  let(:datadog_checks_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'creates template for http checks' do
    expect(datadog_checks_run).to create_template('/etc/dd-agent/conf.d/http_check.yaml')
    .with_variables(
      {:instances=>[{"name"=>"app_name", "url"=>"app_url"}, 
          {"name"=>"app_name_with_password", "url"=>"app_url", "username"=>"username", "password"=>"password"}]}
)
  end

  it 'creates template for process checks' do
    expect(datadog_checks_run).to create_template('/etc/dd-agent/conf.d/process.yaml')
    .with_variables(
      { :instances=>["process"]
      })
  end

  it "ensures datadog directories exist" do
    expect(datadog_checks_run).to create_directory("/etc/dd-agent")
    expect(datadog_checks_run).to create_directory("/etc/dd-agent/conf.d")
  end
end
