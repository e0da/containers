# devd container

Set up a [devd][] container which runs persistently whenever the host
is booted. 

[devd]: https://github.com/cortesi/devd

## Start as daemon

```sh
docker-compose up --detach
```

## Stop

```sh
docker-compose down
```

## License

Copyright Justin Force. Licensed under the [ISC License][].

[isc license]: http://www.opensource.org/licenses/ISC
