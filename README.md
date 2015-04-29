# Jepsen

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

## Dependencies

None

## Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

## License

BSD

## Thanks

Thanks to the following people:

- [Kyle Kingsbury](https://aphyr.com/) (aphyr) for creating Jepsen and for
  all of the hard work he does in validating database software claims
	with it.

- [Brent Woodruff](http://www.brentwoodruff.com/) for his help with various
  tips while I was making this role.

## Author Information

[Brian Shumate](http://brianshumate.com)
