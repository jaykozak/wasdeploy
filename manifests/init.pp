class wasdeploy {

  file { "/opt/puppet/libexec/mcollective/mcollective/agent/wasdeploy.ddl":
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      source  => 'puppet:///modules/wasdeploy/wasdeploy.ddl',
      notify  => Service['pe-mcollective'],
    } ->

  file { "/opt/puppet/libexec/mcollective/mcollective/agent/wasdeploy.rb":
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => '0644',
      source  => 'puppet:///modules/wasdeploy/wasdeploy.rb',
      notify  => Service['pe-mcollective'],
    }

}
