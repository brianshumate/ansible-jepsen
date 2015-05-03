#!/bin/bash

# File: examples/bin/preinstall - convenience script to add Jepsen test
# cluster VM node host information to /etc/hosts for Vagrant/VirtualBox

GREPBIN="/usr/bin/grep"
STARTIP="192.168.122.10"
SUDOBIN="/usr/bin/sudo"
SHBIN="/bin/sh"
VAGRANTBIN="/usr/bin/vagrant"

# Log stuff
function logmsg {
  case "$1" in
  alert)   printf "[!] $2\n"
     ;;
  notice)  printf "[+] $2\n"
     ;;
  info)    printf "[-] $2\n"
     ;;
  *)       printf "[!] It blowed up at me! (with $1)\n" >&2
     ;;
  esac
}

# Check if sudo will need password
function sudocheck {
  logmsg info "Enter your user account password for sudo if prompted."
  $SUDOBIN true
}

# Add hosts entries if necessary
function add_hosts {
  #FIXME: this doesn't work as expected
  if grep -Fq "192.168.122.12" /etc/hosts
  then
    logmsg notice "Jepsen test cluster VM node information present in /etc/hosts"
  else
    sudocheck
    $SUDOBIN $SHBIN -c "echo '# Jepsen test cluster Vagrant virtual machines
192.168.122.10 n0.local n0
192.168.122.11 n1.local n1
192.168.122.12 n2.local n2
192.168.122.13 n3.local n3
192.168.122.14 n4.local n4
192.168.122.15 n5.local n5
' >> /etc/hosts"
    logmsg notice "Jepsen test cluster nodes information added to /etc/hosts"
  fi
}

# Install Vagrant Hosts plugin if necessary
function vagrant_hosts_plugin {
  if $VAGRANTBIN plugin list | $GREPBIN vagrant-hosts > /dev/null 2>&1; then
    logmsg notice "Vagrant Hosts plugin is installed"
  else
    $VAGRANTBIN plugin install vagrant-hosts > /dev/null 2>&1
    logmsg notice "Installed Vagrant Hosts plugin"
  fi
}

add_hosts
vagrant_hosts_plugin