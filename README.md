# MASQER

A teeny tiny wrapping of DNSMASQ to allow deploying it into containerized environments.

### USAGE

A basic docker run invocation looks like the following:

```sh
$ docker run --rm --name masqer \
    -e 'EXTRA_HOSTS=127.0.0.1 myawesome.service" \
    ghcr.io/prod9/masqer
```

Things to note:

* Put stuff in `EXTRA_HOSTS` env var which you would normally put in `/etc/hosts`
* It starts `dnsmasq` with a few flags to make it runs in the foreground and logs to the
  console.

### DEV/TEST

Some [smoke testing] scripts were provided, run with:

```sh
$ ./smoke -vv
```

To manually test, just build and run 2 containers in a network and have one `dig` the
other for information. Check the `smoke-tests.yml` file for example.

### LICENSE

MIT

