# fwup

Build [fwup][] into a container so you don't have to splatter its hairy
dependencies all over your nice clean machine, and install a wrapper to make
using it seamless.

[fwup]: https://github.com/fhunleth/fwup

## Install

```sh
make install
# Or for a custom prefix
PREFIX=/usr/local/bin make install
```

## Use

```sh
fwup --help
```
