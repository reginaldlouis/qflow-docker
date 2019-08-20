# Qflow docker

## Build
To build a qflow image from official package repository
```
docker build -f Dockerfile-from-package -t qflow .
```

To build a custom qflow, tweak as need `Docker-from-source` and run
```
docker build -f Dockerfile-from-source -t qflow .
```

## Run
To run qflow as command line interface
```
docker run --rm -v $(pwd):/workspace qflow <arguments>
```

To run `qflow gui`
```
docker run --rm -v $(pwd):/workspace qflow gui <arguments>
```