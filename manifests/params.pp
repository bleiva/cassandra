# == Class cassandra::params
#
# This class is meant to be called from cassandra
# It sets variables according to platform
#
class cassandra::params {
  case $::osfamily {
    'Debian': {
      $cassandra_pkg = 'cassandra'
      $config_path = '/etc/cassandra'
      $java_package = 'openjdk-7-jre-headless'
      $jna_package_name = 'libjna-java'
      $optutils_package_name = 'cassandra-tools'
      $systemctl = '/bin/systemctl'
    }
    'RedHat': {
      $cassandra_pkg = 'cassandra22'
      $config_path = '/etc/cassandra/default.conf'
      $java_package = 'java-1.8.0-openjdk-headless'
      $jna_package_name = 'jna'
      $optutils_package_name = 'cassandra22-tools'
      $systemctl = '/usr/bin/systemctl'
    }
    default: {
      $config_path_parents = []
    }
  }
}
