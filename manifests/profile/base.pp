### Profile
### Hier wird das Hiera File eingebunden


class site::profile::base {
  include ::tools

exec { "git clone https://github.com/CISOfy/lynis.git /usr/local/bin/lynis":
  path   => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
  unless => "ls /usr/local/bin/lynis"
}

file { '/usr/local/bin/lynisrun':
     path    => '/usr/local/bin/lynisrun',
     mode    => '700',
     owner   => 'root',
     ensure  => present,
     content => "#!/bin/bash
cd /usr/local/bin/lynis
./lynis audit system -Q",

}

file {'remove_old_directory':
     ensure => absent,
     path => '/root/lynis',
     recurse => true,
     purge => true,
     force => true,
     }


file { 'lynis-report.date' :
    path  => "/var/log/lynis-report.dat",
    owner => 'prtg-ssh'
}
}
