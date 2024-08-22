# solving request limit issue

$pt = 'ULIMIT="-n 4096"'

exec { 'nginx-limit-req':
        provider => 'shell',
        command  => "sed -i 's/^ULIMIT=.*/${pt}/ /etc/default/nginx'",
        unless   => "grep -q '^${pt}\$ /etc/default/nginx'",
}

exec { 'reload':
        provider => 'shell',
        command  => 'sudo service nginx restart',
}
