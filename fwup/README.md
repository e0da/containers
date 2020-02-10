# fwup

Develop the building of [fwup][] with a container so you don't mess up your host
system tinkering with it. Once it works, run

```sh
./build.ubuntu.bash
```

to install it.

Originally I developed this as an alpine image thinking I'd use it that way
without realizing the container can't access your local filesystem without some
more configuration. Better to use this container to document the installation
process and just install it natively.

[fwup]: https://github.com/fhunleth/fwup

## Build

```sh
make
# Or build the alpine build
make build.alpine
```
