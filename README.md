```
            _
           | |
           | |
           | |
  _________|_|
 |           |
 |   (|||)   |
 | _________ |
 ||         ||
 ||         ||
 ||_________||
 |           |
 |[1] [2] [3]|       _
 |           |      | | ___ _ __  ___  ___ _ __
 |[4] [5] [6]|   _  | |/ _ \ '_ \/ __|/ _ \ '_ \
 |           |  | |_| |  __/ |_) \__ \  __/ | | |
 |[7] [8] [9]|   \___/ \___| .__/|___/\___|_| |_|
 |           |             |_|
 |    [0]    |
 |           |
 |   (|||)   |
 |___________|CA15


```

> NOTE: This is a work in progress and is not yet fully functional
>       The author's JVM/Clojure fu is sorely lacking and so there is
>       an inexplicable Auth fail error still preventing this from working
>       See: #1

This role prepares a cluster for testing various databases with
[Jepsen](https://github.com/aphyr/jepsen).

Be sure to read all of the great work Kyle Kingsbury has done with Jepsen
in his series of [Call me maybe posts](https://aphyr.com/tags/Jepsen).

## Requirements

This role is dependent on Orcale Java Server JDK; you will need to manually
download the JDK package and specify its file name as the variable
`jepsen_java_binary` in `defaults/main.yml` and place the actual
packge file into the `files/` subdirectory of this role.

For example in `defaults/main.yml`:

```
jepsen_java_binary: jdk-8u45-linux-x64.tar.gz
```

and the contents of `files/`:

```
ls -1 files
jdk-8u45-linux-x64.tar.gz
```

## Role Variables

The default variables for this project in `defaults/main.yml` are as follows:

| Name                                 | Default  | Description                                    |
| ------------------------------------ | -------- | ---------------------------------------------- |
| jepsen_user          | vagrant    | OS username |
| jepsen_group         | vagrant    | OS groupname |
| jepsen_user_home     | /home/vagrant | OS user home directory |
| jepsen_test_node_os_packages | list | OS packages to install for the test nodes |
| jepsen_java_binary | jdk-8u45-linux-x64.tar.gz | Filename for the Oracle Java binary tarball |
| jepsen_java_package | oracle-j2sdk1.8_1.8.0+update45_amd64.deb | Filename for Debian package created from jepsen_java_binary |
| jepsen_makejpkg_script | /usr/share/java-package/oracle-j2sdk.sh | Filename of make-jpkg script to replace with modified version for Java 8 support |
| jepsen_lein_script_url | https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein | URL to the Leiningen script |
|jepsen_lein_script_shasum | sha 256 summary | The SHA 256 summary for Leiningen script |

## Dependencies

None

## Example Playbook

An example playbook, `jespsen_init.yml` is available in the `examples`
directory and can be executed like this:


```
ansible-playbook -i $HOSTS jepsen_init.yml
```

where `$HOSTS` represents the filename of your hosts inventory file.

## Quick Start

1. Place your Java binary in the `files` directory as described in
   **Requirements**, don't forget to update the `jepsen_java_binary`
	 and `jepsen_java_package` variables in `defaults/main.yml` as well.
2. `cd examples`
3. `vagrant up`
4. Time passes...
5. More time passes...
6. `vagrant ssh n0`
7. `cd jepsen/$DATABASE`
8. `lein test`

Pick your poison; substitute `$DATABASE` for one to run Jepsen against
as listed in `~/jepsen/`:

* aerospike
* elasticsearch
* mongodb

## License

BSD

## Thanks

Thanks to the following people:

- [Kyle Kingsbury](https://aphyr.com/) ([@aphyr](https://github.com/aphyr)) for creating Jepsen and for
  all of the hard work he does in validating database software with it.

- [Brent Woodruff](http://www.brentwoodruff.com/) for his help with various
  tips while I was making this role.

## Author Information

[Brian Shumate](http://brianshumate.com)
