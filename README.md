A minimal example build with Docker and http://sparkjava.com/

* build:  
``` 
$ docker build -t giantswarm/sparkexample .
```

* run:
```
$ docker run -p 4567:4567 giantswarm/sparkexample
```

Detailed description in this blogpost: http://blog.giantswarm.io/getting-started-with-java-development-on-docker