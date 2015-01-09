# Get started with Java and Postgres on GiantSwarm.io

A small example leveraring Docker, [Sparkjava](http://sparkjava.com) and [giantswarm.io](http://giantSwarm.io) for a super fast headstart on creating a *live* app with Java and Postgres.

## Prerequisites
You need Git, Make and Docker installed and a free Giant Swarm account. [Request a invite](http://giantSwarm.io)!

## Steps

```bash
$ git clone https://github.com/giantswarm/sparkexample.git && cd sparkexample
$ # make your changes to Hello.Java
$ make push  # builds and pushes Docker images
$ make up  # creates and starts application at Giant Swarm
$ # profit
```

Look into simple [Makefile](./Makefile) for details. See also a [the blogpost](http://blog.giantswarm.io/getting-started-with-java-development-on-docker) about an older version of this example.