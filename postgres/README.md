# postgres container

Set up a [PostgreSQL][] container which runs persistently whenever the host
is booted. Useful replacement for installing postgres from OS/distro package
management which I have found to be error prone, especially in the event your
OS gets newer but you have to keep working with older versions of postgres.

[postgresql]: https://www.postgresql.org/

## Start as daemon

```sh
docker-compose up --detach
```

## Connect

For convenience save your **INSECURE** credentials:

```sh
cat <<EOF >> ~/.pgpass
localhost:5432:*:postgres:insecure
EOF
chmod 0600 ~/.pgpass
```

And set your default username and host in your environment (`~/.bashrc`,
`~/.zshrc`, etc.)

```sh
export PGHOST=localhost
export PGUSER=postgres
```

And you can just

```sh
psql
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
