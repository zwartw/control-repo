# Sample role class. This is not actually used.
# Edit puppet-modules/manifests/site.pp to define profiles
# in role classes instead of looking for them on hiera
#
#
class role::basics {

  include ::profile::motd

}
