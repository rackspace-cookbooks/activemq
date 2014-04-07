name             'rackspace_activemq'
<<<<<<< HEAD
maintainer       'Rackspace'
=======
maintainer       'Rackspace US Inc.'
>>>>>>> ee871d749238c6730d754f8b73d27021587e8de6
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'Apache 2.0'
description      'Installs and configures activemq'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
<<<<<<< HEAD
version          '1.0.0'
=======
version          '2.0.2'
>>>>>>> ee871d749238c6730d754f8b73d27021587e8de6

%w(ubuntu debian redhat centos).each do |os|
  supports os
end

depends 'java', '~> 1.13'

provides 'rackspace_activemq'
