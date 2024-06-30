# configure ssh
# disable password authentication
# use school priv key
include stdlib


file_line {'ssh_key':
    ensure => 'present',
    line   => '\tIdentityFile ~/.ssh/school',
    path   => '/etc/ssh/ssh_config',
    match  => "^#*\s*IdentityFile\s+~/.ssh/id_rsa$"
}


file_line {'ssh_pass':
    ensure => 'present',
    line   => '\tPasswordAuthentication no',
    path   => '/etc/ssh/ssh_config',
    match  => "^#*\s*PasswordAuthentication\s+yes$"
}
