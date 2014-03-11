name             'rackspace_activemq'
maintainer       'Rackspace'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'Apache 2.0'
description      'Installs and configures activemq'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

%w(ubuntu debian redhat centos).each do |os|
  supports os
end

depends 'java', '~> 1.13'

provides 'rackspace_activemq'
