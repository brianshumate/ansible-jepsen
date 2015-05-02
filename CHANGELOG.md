## v1.0.0

- Initial release

## v1.0.1

- Remove old test keys
- Documentation updates

## v1.0.2

- Change to DSA based keys
- Add libjna-java package
- Add host keys to known_hosts file on console node
- Updated documentation

## v1.1.0

- Switch to Debian 8
- Set root user up according to jepsen/lxc.md
- Add ssh pubkey for root user
- Add a .ssh/config on each node
- Update documentation
- Add SUCCESS.jpg ;)

## v1.1.1

- Update documentation re: still a work in progress

## v1.1.2

- Use Java 7 JDK
- Update sshd_config key exchange algorithms and MACs for Algorithm error
  after change to Java 7
- Better way to (conditionally) handle the generation of duplicate host
  keys which happens with Vagrant based boxes
- Update IP address range throughout
- Shake fist at Auth fail

## v1.1.3

- Back to Java 8 JDK
- Refactor jepsen_init playbook
- Removed unnecessary 'jepsen_makejpkg_script' variable
- Updated documentation
