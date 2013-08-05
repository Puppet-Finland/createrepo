#
# == Class: createrepo::config
#
# Configure createrepo
#
class createrepo::config($documentroot) {

    file { [ "${documentroot}/repos/yum", "${documentroot}/repos/yum/conf" ]:
        ensure => directory,
        require => Class['softwarerepo::install']
    }
}
