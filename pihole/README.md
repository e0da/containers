# pihole container

Set up a [Pi-hole][] container which runs persistently whenever the host
is booted.

[pi-hole]: https://pi-hole.net/

## Start as daemon

```sh
docker-compose up --detach
```

## Connect

<http://localhost:9000/>

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
