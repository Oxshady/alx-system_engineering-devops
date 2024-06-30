# configure ssh
# disable password authentication
# use school priv
include stdlib

file_line {'ssh_key':
    line               => '    IdentityFile ~/.ssh/school',
    path               => '/etc/ssh/sshd_config',
    match              => "^[#]*[\s]*IdentityFile[\s]+~/.ssh/id_rsa$"
    append_on_no_match => true
    replace            => true,
}


file_line {'ssh_pass':
    line               => '    PasswordAuthentication no',
    path               => '/etc/ssh/sshd_config',
    match              => "^#*\s*PasswordAuthentication\s+yes$"
    append_on_no_match => true
    replace            => true,
}

