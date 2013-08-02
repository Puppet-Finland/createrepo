#
# == Define: createrepo::repo
#
# Setup a yum repo using createrepo
#
# == Parameters
#
# [*reponame*]
#   Name of the repository. This must be unique, as it's used for the name of
#   the repository directory.
# [*description*]
#   Description of this repository.
# [*gpg_key_id*]
#   ID of the GPG key used for signing the packages. Defaults to top-scope
#   variable $::rpm_gpg_key_id.
#
define createrepo::repo(
    $reponame,
    $description,
    $gpg_key_id=$::rpm_gpg_key_id
)
{
    file { "createrepo-${reponame}":
        name => "/var/www/repos/yum/${reponame}",
        ensure => directory,
        owner => root,
        group => root,
        mode => 755,
        require => Class['createrepo::config'],
    }

    file { "createrepo-${reponame}.repo":
        name => "/var/www/repos/yum/conf/${fqdn}-${reponame}.repo",
        content => template('createrepo/reponame.repo.erb'),
        ensure => present,
        owner => root,
        group => root,
        mode => 644,
        require => Class['createrepo::config'],
    }

    file { "createrepo-${reponame}.txt":
        name => "/var/www/repos/yum/conf/${fqdn}-${reponame}.txt",
        ensure => present,
        content => template('createrepo/reponame.txt.erb'),
        owner => root,
        group => root,
        mode => 644,
        require => Class['createrepo::config'],
    }
}
