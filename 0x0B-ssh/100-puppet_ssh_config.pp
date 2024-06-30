# configure ssh
# disable password authentication
# use school priv key

file_line {'ssh_key':
    ensure  => 'present',
    line    => '\tIdentityFile ~/.ssh/school',
    path    => '/etc/ssh/ssh_config',
    match   => "^#*\s*IdentityFile\s+~/.ssh/id_rsa$"
    replace => true,
}

file_line {'ssh_pass':
    ensure  => 'present',
    line    => '\tPasswordAuthentication no',
    path    => '/etc/ssh/ssh_config',
    match   => "^#*\s*PasswordAuthentication\s+yes$"
    replace => true,
}

