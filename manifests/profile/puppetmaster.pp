### Profile
### Hier wird das Hiera File eingebunden

 class site::profile::puppetmaster {




#### Firewall rules ####

  firewall { '100 allow puppetmaster foreman access':
   dport  => [ 22, 80, 443, 8140, 3000, 8443],
   proto  => tcp,
   action => accept,
  }

  firewall { '101 allow snmp access':
   dport => 161,
   proto => udp,
   action => accept,
  }
}
