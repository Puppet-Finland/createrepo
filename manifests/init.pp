#
# == Class: createrepo
#
# Manage yum repositories with createrepo
#
# == Parameters
#
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
    $configure_webserver='false'
)
{
    include createrepo::install
    include createrepo::config

    if $configure_webserver == 'apache2' {
        include createrepo::config::apache2
    }
}
