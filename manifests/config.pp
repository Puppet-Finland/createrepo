#
# == Class: createrepo::config
#
# Configure createrepo
#
class createrepo::config {

    file { [ '/var/www/repos/yum', '/var/www/repos/yum/conf' ]:
        ensure => directory,
        require => Class['softwarerepo::install']
    }
}
