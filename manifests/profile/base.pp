### Profile
### Hier wird das Hiera File eingebunden


class site::profile::base {
  include ::tools
#  include ::sysctl::base


  # deaktivate firewire and usb-storage modules
  #  kmod::blacklist { ['firewire-ohci','usb-storage']: }


# for testing hardening index with lynis

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

cron::job { 'update-lynis':
    minute      => '5',
    hour        => '2',
    date        => '*',
    month       => '*',
    weekday     => '*',
    user        => 'root',
    command     => 'cd /usr/local/bin/lynis && git pull',
    environment => [ 'MAILTO=root', 'PATH="/usr/bin:/bin:/usr/local/bin"', ],
}
cron::job { 'run-lynis':
    minute      => '10',
    hour        => '2',
    date        => '*',
    month       => '*',
    weekday     => '*',
    user        => 'root',
    command     => 'lynisrun',
    environment => [ 'MAILTO=root', 'PATH="/usr/bin:/bin:/usr/local/bin"', ],
}

file { 'lynis-report.date' :
    path  => "/var/log/lynis-report.dat",
    owner => 'prtg-ssh'
}
}
