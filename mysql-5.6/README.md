# mysql 5.6 container

Set up a [MySQL][] [container][] which runs persistently whenever the host
is booted. Useful replacement for installing MySQL from OS/distro package
management which I have found to be error prone, especially in the event your
OS gets newer but you have to keep working with older versions of MySQL.

Includes [Adminer][] because it was in the MySQL container docs and why not?

[adminer]: https://www.adminer.org/
[container]: https://hub.docker.com/_/mysql
[mysql]: https://www.mysql.com/

## Start as daemon

```sh
docker-compose up --detach
```

## Connect

For convenience save your **INSECURE** credentials:

```sh
cat <<EOF >> ~/.my.cnf
[mysql]
user=root
password=insecure
host=0.0.0.0
EOF
chmod 0600 ~/.my.cnf
```

And you can just

```sh
mysql
```

## Stop

```sh
docker-compose down
```

## Stop and purge data (hard reset)

To purge the volumes and hard reset

```sh
docker-compose down --volumes
```

## License

Copyright Justin Force. Licensed under the [ISC License][].

[isc license]: http://www.opensource.org/licenses/ISC
