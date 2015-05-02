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

This role prepares a cluster for testing various databases with
[Jepsen](https://github.com/aphyr/jepsen).

Be sure to read all of the great work Kyle Kingsbury has done with Jepsen
in his series of [Call me maybe posts](https://aphyr.com/tags/Jepsen). Also,
have a look at his related presentations to get a better idea of what Jepsen
is all about:

* [Call Me Maybe: Carly Rae Jepsen and the Perils of Network Partitions](https://www.youtube.com/watch?v=mxdpqr-loyA)
* [Jepsen II: Linearizable Boogaloo](https://www.youtube.com/watch?v=QdkS6ZjeR7Q)
* [Jepsen: ZK, NuoDB, Kafka, & Cassandra](https://www.youtube.com/watch?v=NsI51Mo6r3o)

## Requirements

This role is dependent on the Oracle Java JDK; you will need to manually
download the JDK package and specify its file name as the
`jepsen_java_tarball` variable in `defaults/main.yml`,then place the actual
tarball into the `files` subdirectory of this role.

For example in `defaults/main.yml`:

```
jepsen_java_tarball: jdk-8u45-linux-x64.tar.gz
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
| jepsen_java_tarball | jdk-8u45-linux-x64.tar.gz | Filename for the Oracle Java binary tarball |
| jepsen_java_package | oracle-j2sdk1.8_1.8.0+update45_amd64.deb | Filename for Debian package created from jepsen_java_tarball |
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

## Quick Start with Vagrant

Add the hosts to `/etc/hosts` on the system from which you will execute
this role:

```
192.168.122.10 n0.local n0
192.168.122.10 n1.local n1
192.168.122.10 n2.local n2
192.168.122.10 n3.local n3
192.168.122.10 n4.local n4
192.168.122.10 n5.local n5
```

Define your Ansible roles path (for convenience in following steps):

```
export ROLESPATH=FULL_PATH_TO_ANSIBLE_ROLES
```

Install the playbook:

```
ansible-galaxy install brianshumate.jepsen
```

Then copy your Java tarball to `$ROLESPATH/files` directory as described in
the **Requirements** section; don't forget to update the `jepsen_java_tarball`
and `jepsen_java_package` variables in `defaults/main.yml` as well.

Fire up Vagrant and kickoff the playbook:

```
cd $ROLESPATH/examples
vagrant up
```

Login to the control node and try a Jespsen test:

```
vagrant ssh n0
cd jepsen/$DATABASE
lein test
```

Pick your poison; substitute `$DATABASE` for one to run Jepsen against
as listed in the `jepsen` project directory:

* aerospike
* elasticsearch
* mongodb

"Help, I'm using VirtualBox, getting SSH timeouts, and the playbook fails!"

Re-run the playbook based on Ansible's `--limit` suggestion while shaking
your fist at VirtualBox and adjusting the onion on your belt. For example:

```
ansible-playbook -i debian --limit @$HOME/jepsen_init.retry jepsen_init.yml
```

## License

BSD

## Thanks

Thanks to the following people:

- [Kyle Kingsbury](https://aphyr.com/) ([@aphyr](https://github.com/aphyr))
  for creating Jepsen and for all of the hard work he does in validating
	database software with it

- [Brent Woodruff](http://www.brentwoodruff.com/) for his help with various
  tips while I was making this role

## Author Information

[Brian Shumate](http://brianshumate.com)
