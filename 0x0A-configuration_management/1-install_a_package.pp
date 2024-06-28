# this manifest install python package using pip
exec {'flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  unless  =>  '/usr/bin/pip3 show flask | grep -q "^Version: 2.1.0"',
  path    => ['/usr/bin', 'bin']
}
