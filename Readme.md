# Qflow docker

## Build
To build a qflow image from official package repository only
```
docker build -f pkg.Dockerfile -t qflow .
```

To build a custom qflow and dependencies from source code, run
```
docker build -f dev.Dockerfile -t qflow .
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