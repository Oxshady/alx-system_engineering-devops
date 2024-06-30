# configure ssh
# disable password authentication
# use school priv
include stdlib

file_line {'ssh_key':
    line               => '    IdentityFile ~/.ssh/school',
    path               => '/etc/ssh/sshd_config',
    match              => "^[#]+[\s]*(?i)IdentityFile[\s]+~/.ssh/id_rsa$"
    replace            => true,
    append_on_no_match => true
}


file_line {'ssh_pass':
    line               => '    PasswordAuthentication no',
    path               => '/etc/ssh/sshd_config',
    match              => "^[#]+[\s]*(?i)PasswordAuthentication[\s]+(yes|no)$"
    replace            => true,
    append_on_no_match => true
}

