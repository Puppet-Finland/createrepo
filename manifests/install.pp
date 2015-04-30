#
# == Class: createrepo::install
#
# Install createrepo
#
class createrepo::install {

    package { 'createrepo-createrepo':
        ensure => installed,
        name   => 'createrepo',
    }
}
