class site::profile::rpm {
  include site::profile::base
  include ::git
  #  include ::ssh
}
  #case $operatingsystemmajrelease {


  #  /6/ : { yumrepo {"EPEL_6":
  #    baseurl    => 'http://id-mirror.unibe.ch/mrepo/centos6-x86_64/RPMS.epel/',
  #    descr      => "CentOS 6 EPEL repository",
  #    gpgkey     => "http://id-mirror.unibe.ch/rpm-gpg-keys/RPM-GPG-KEY-EPEL-6",
  #    enabled    => 1,
  #    gpgcheck   => 1,
  #}
  #}
  #/7/ : { yumrepo {"EPEL_7":
  #    baseurl       => 'http://id-mirror.unibe.ch/mrepo/centos7-x86_64/RPMS.epel/',
  #descr       => "CentOS 7 EPEL repository",
  #    gpgkey     => "http://id-mirror.unibe.ch/rpm-gpg-keys/RPM-GPG-KEY-EPEL-7",
  #    enabled   => 1,
  #    gpgcheck => 1,
  #}
  #}
  #}
  #
  #yumrepo {"IDSYS":
  #    baseurl  => 'http://id-mirror.unibe.ch/mrepo/centos6-x86_64/RPMS.idsys/',
  #    descr    => "IDSYS repository",
  #    gpgkey   => "http://id-mirror.unibe.ch/rpm-gpg-keys/RPM-GPG-KEY-IDSYS-6",
  #    enabled  => 1,
  #    gpgcheck => 1,
  #   }

  #}
