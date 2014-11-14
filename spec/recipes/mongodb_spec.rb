require 'spec_helper'

describe 'datadog_checks::mongodb' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  let(:datadog_checks_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'creates template for mongodb' do
    expect(datadog_checks_run).to create_template('/etc/dd-agent/conf.d/mongo.yaml')
    .with_variables(
      {})
  end
end
