# new admin

$u = 'holberton'
$f = '/etc/security/limits.conf'

exec { 'Increase soft number of files limit':
        provider => 'shell',
        command  => "sed -i 's/^${u} soft nofile.*\$/${u} soft nofile 4096/' ${f}",
}

exec { 'Increase hard number of files limit':
        provider => 'shell',
        command  => "sed -i 's/^${u} hard nofile.*\$/${u} hard nofile 4096/' ${f}",
}

exec { 'reload limits':
        provider => 'shell',
        command  => 'sudo sysctl -p',
}
