#
# == Class: createrepo::install
#
# Install createrepo
#
class createrepo::install {

    package { 'createrepo-createrepo':
        name => 'createrepo',
        ensure => installed,
    }
}
