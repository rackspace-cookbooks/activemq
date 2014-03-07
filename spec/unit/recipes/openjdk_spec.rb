require 'spec_helper'

describe 'java::default' do
  platforms = {
    'ubuntu' => {
      'packages' => %w('openjdk-6-jdk' 'openjdk-6-jre-headless'),
      'versions' => ['12.04'],
      'update_alts' => true
    },
    'centos' => {
      'packages' => %w('java-1.6.0-openjdk' 'java-1.6.0-openjdk-devel'),
      'versions' => ['6.3'],
      'update_alts' => true
    }
  }

  platforms.each do |platform, data|
    data['versions'].each do |version|
      context "On #{platform} #{version}" do
        let(:chef_run) do
          runner = ChefSpec::Runner.new(platform: platform.to_s, version: version.to_s)
          runner.converge('java::default')
        end

        data['packages'].each do |pkg|
          it "installs package #{pkg}" do
            expect(chef_run).to install_package(pkg)
          end
        end
      end
    end
  end
end
