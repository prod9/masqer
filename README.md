# MASQER

A teeny tiny wrapping of DNSMASQ to allow deploying it into containerized environments.

### USE CASES

Reasons this was made:

* Emulating `/etc/hosts` for a cluster of pods on Kubernetes

Why?

* You don't want to mess with `/etc/hosts` inside Docker containers which requires dirty
  hacks to make work.
* You do not want to run or configure a full blown authoritative DNS server just for a
  single host
* You have no access to DNS in a very restrictive network but still want to centralize
  some IP mappings used in multiple other containers.

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

Some [smoke testing](github.com/chakrit/smoke) scripts were provided, run with:

```sh
$ ./smoke -vv
```

To manually test, just build and run 2 containers in a network and have one `dig` the
other for information. Check the `smoke-tests.yml` file for example.

### LICENSE

MIT

