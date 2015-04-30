#
# == Define: createrepo::repo
#
# Setup a yum repo using createrepo
#
# == Parameters
#
# [*documentroot*]
#   Web server's document root directory. Defaults to 
#   $::createrepo::config::documentroot.
# [*reponame*]
#   Name of the repository. This must be unique, as it's used for the name of
#   the repository directory. Defaults to $title, i.e. name of the resource.
# [*description*]
#   Description of this repository. Defaults to 'No description'.
# [*gpg_key_id*]
#   ID of the GPG key used for signing the packages. Defaults to top-scope
#   variable $::rpm_gpg_key_id.
#
define createrepo::repo(
    $documentroot=$::createrepo::config::documentroot,
    $reponame=$title,
    $description='No description',
    $gpg_key_id=$::rpm_gpg_key_id
)
{
    file { "createrepo-${reponame}":
        ensure  => directory,
        name    => "${documentroot}/repos/yum/${reponame}",
        owner   => root,
        group   => root,
        mode    => '0755',
        require => Class['createrepo::config'],
    }

    file { "createrepo-${reponame}.repo":
        ensure  => present,
        name    => "${documentroot}/repos/yum/conf/${::fqdn}-${reponame}.repo",
        content => template('createrepo/reponame.repo.erb'),
        owner   => root,
        group   => root,
        mode    => '0644',
        require => Class['createrepo::config'],
    }

    file { "createrepo-${reponame}.txt":
        ensure  => present,
        name    => "${documentroot}/repos/yum/conf/${::fqdn}-${reponame}.txt",
        content => template('createrepo/reponame.txt.erb'),
        owner   => root,
        group   => root,
        mode    => '0644',
        require => Class['createrepo::config'],
    }
}
