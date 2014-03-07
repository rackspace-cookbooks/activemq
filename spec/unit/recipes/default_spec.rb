#
# Cookbook Name:: activemq
#
# Copyright 2014, Rackspace, UK, Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'

describe 'activemq::default' do
  activemq_test_platforms.each do |platform, versions|
    describe "on #{platform}" do
      versions.each do |version|
        describe version do
          before :each do
            stub_command('test -f /var/run/activemq.pid').and_return(true)
            stub_command('tar zxf /var/chef/cache/apache-activemq-5.8.0-bin.tar.gz').and_return(true)
          end
          let(:chef_run) do
            runner = ChefSpec::Runner.new(platform: platform.to_s, version: version.to_s)
            runner.converge('activemq::default')
          end
          it 'include the default recipe' do
            expect(chef_run).to include_recipe 'activemq::default'
          end
          it 'file jdk.sh exists' do
            expect(chef_run).to create_file '/etc/profile.d/jdk.sh'
          end
          it 'file bin/activemq exists' do
            expect(chef_run).to create_file '/opt/apache-activemq-5.8.0/bin/activemq'
          end
          it 'populate the opt directory' do
            expect(chef_run).to create_directory('/opt')
          end
          it 'populate the /etc/profile.d directory' do
            expect(chef_run).to create_directory('/etc/profile.d')
          end
          it 'validate activemq tar.gz file' do
            expect(chef_run).to create_remote_file('/var/chef/cache/apache-activemq-5.8.0-bin.tar.gz')
          end
          it 'extract activemq tar.gz file' do
            expect(chef_run).to run_execute('tar zxf /var/chef/cache/apache-activemq-5.8.0-bin.tar.gz')
          end
          it 'enables the service' do
            expect(chef_run).to enable_service('activemq')
          end
        end
      end
    end
  end
end
