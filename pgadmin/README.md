# portainer container

Set up a [pgAdmin][] [container][] which runs persistently whenever the host
is booted.

[pgadmin]: https://www.pgadmin.org/
[container]: https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html

## Start as daemon

```sh
docker-compose up --detach
```

## Connect

<http://localhost:8080/>

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
