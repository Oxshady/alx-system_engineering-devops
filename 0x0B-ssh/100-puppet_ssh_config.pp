# configure ssh
# disable password authentication
# use school priv key
service { 'sshd':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  provider   => 'systemd'
}

file_line {'ssh_key':
    ensure  => 'present',
    line    => '\tIdentityFile ~/.ssh/school',
    path    => '/etc/ssh/sshd_config',
    match   => "^#*\s*IdentityFile\s+~/.ssh/id_rsa$"
    replace => true,
    notify  => Exec['sshd_restart'],
}


file_line {'ssh_pass':
    ensure  => 'present',
    line    => '\tPasswordAuthentication no',
    path    => '/etc/ssh/sshd_config',
    match   => "^#*\s*PasswordAuthentication\s+yes$"
    replace => true,
    notify  => Exec['sshd_restart'],
}

exec { 'sshd_restart':
  path        => '/usr/bin:/bin',
  command     => '/bin/systemctl restart sshd',
  refreshonly => true
}
