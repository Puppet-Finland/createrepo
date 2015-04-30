#
# == Class: createrepo::config::apache2
#
# Configure Apache2 for use with createrepo
#
class createrepo::config::apache2 {

    # Install an Apache2 configuration file fragment for createrepo
    file { 'createrepo-createrepo':
        ensure  => present,
        name    => '/etc/apache2/conf.d/createrepo',
        content => template('createrepo/createrepo.erb'),
        owner   => root,
        group   => root,
        mode    => '0644',
        require => Class['apache2::install'],
        notify  => Class['apache2::service'],
    }
}
