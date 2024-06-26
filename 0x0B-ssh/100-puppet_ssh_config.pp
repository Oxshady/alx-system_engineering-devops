# configure ssh
# disable password authentication
# use school priv
include stdlib

file_line {'ssh_key':
  path               => '/etc/ssh/ssh_config',
  line               => '    IdentityFile ~/.ssh/school',
  match              => '^[#]+[\s]*IdentityFile[\s]+~/.ssh/id_rsa$',
  replace            => true,
  append_on_no_match => true
}


file_line {'ssh_pass':
  path               => '/etc/ssh/ssh_config',
  line               => '    PasswordAuthentication no',
  match              => '^[#]+[\s]*PasswordAuthentication[\s]+no$',
  replace            => true,
  append_on_no_match => true
}

