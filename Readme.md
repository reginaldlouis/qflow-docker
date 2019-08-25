# Qflow docker

## Build
`docker build -f pkg.Dockerfile -t qflow:1.3 .`

## Run
To run qflow as command line interface with GUI

`docker run --rm -v $(pwd):/workspace qflow <args>`

## Linux/macOS
```
xhost + localhost
docker run --rm -e DISPLAY=host.docker.internal:0 -v $(pwd):/workspace \
    -w /workspace qflow 
```

# What's inside
| Software  | Version   |
|-----------|-----------|
| IVerilog  | 10.3      |
| Yosys     | 0.8       |
| graywolf  | 0.1.6     |
| qrouter   | 1.4.9     |
| magic     | 8.2.102   |
| netgen    | 1.5.118   |
| qflow     | 1.3       |
