require_relative 'spec_helper'
RSpec.describe Configuration do
  before(:all) do
    @config_dir = File.expand_path('~/.bliss')
    @config_path = "#{@config_dir}/config.yml"
    FileUtils.mkdir_p(@config_dir)
    @live_config = File.exist?(@config_path) ? YAML.load_file(@config_path) : {}

    File.write(@config_path, File.read('./spec/fixtures/config.yml'))
  end

  after(:all) do
    File.write(@config_path, @live_config.to_yaml)
  end

  let(:including_class) { Class.new { include Configuration } }

  context 'configure environment' do
    it 'can read in an existing configuration file' do
      instance = including_class.new
      instance.load_configuration
      config = instance.instance_variable_get('@config')
      expect(config['API_KEY']).to eq('TESTAPIKEY')
      expect(config['TOP_LVL_DIR']).to eq('/home/testtoplvlpath')
      expect(config['ORG_NAME']).to eq('testorgname')
    end
  end
end
