# new admin

$file_path = '/etc/default/nginx'
$line = 'ULIMIT="-n 4096"'

exec { 'modify':
        provider => 'shell',
        command  => "sed -i 's/^ULIMIT=.*/${line}/' ${file_path}",
        unless   => "grep -q '^${line}\$' ${file_path}",
}

exec { 'restart':
        provider => 'shell',
        command  => 'sudo service nginx restart',
}
