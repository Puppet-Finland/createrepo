#
# == Class: createrepo
#
# Manage yum repositories with createrepo
#
# == Parameters
#
# [*documentroot*]
#   Web server's document root directory. Defaults to 
#   $::softwarerepo::config::documentroot, which defaults to 
#   $::webserver::config::documentroot, which is '/var/www' by default.
# [*configure_webserver*]
#   Select which webserver to configure. Valid values are 'apache2', 'nginx' and
#   'false' (don't configure). Currently the value 'nginx' does nothing.
#   Defaults to 'false'.
#
# == Examples
#
# class { 'createrepo':
#   configure_webserver => 'apache2',
# }
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-lisence
# See file LICENSE for details
#
class createrepo
(
    $documentroot=$::softwarerepo::config::documentroot,
    $configure_webserver='false'
)
{
# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_createrepo') != 'false' {

    include createrepo::install

    class { 'createrepo::config':
        documentroot => "${documentroot}",
    }

    if $configure_webserver == 'apache2' {
        include createrepo::config::apache2
    }
}
}
