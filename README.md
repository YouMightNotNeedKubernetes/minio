# minio
Docker Stack deployment for MinIO Object Storage.

## Getting Started

As a recommendation, you should only have MinIO deployed per Docker Swarm Cluster.

## Deployment Modes

There are 2 deployment modes for MinIO.
- Single
- Distributed

### Deploy a single environment
> WIP

### Deploy a distributed environment

Before you can deploy MinIO, you need to have a Docker Swarm Cluster up and running with at least 3 or more nodes.

There are some decisions you need to make before deploying MinIO.
- How many MinIO instances do you want to deploy?
- How much storage do you want to allocate to each instance?

### Deploy a test environment
> WIP

## IMPORTANT

This stack uses the `local` driver for the volumes by default. This means that the data will be stored on the local node.

If you want to use a different driver, you need to create a volume name `minio-data` with the driver you want to use.

Here is an example of creating a volume with the `local` driver:
```sh
# You can specify the driver with the --driver local flag or omit it as it is the default driver.
docker volume create minio-data
```

> See https://docs.docker.com/engine/reference/commandline/volume_create/ for more information.

If you wish to share data between machines, read here [Share data between machines](https://docs.docker.com/storage/volumes/#share-data-between-machines).
