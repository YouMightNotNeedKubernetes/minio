# minio
Docker Stack deployment for MinIO Object Storage.

## Getting Started

As a recommendation, you should only have MinIO deployed per Docker Swarm Cluster.

### Prerequisites

Before you can deploy MinIO, you need to have a Docker Swarm Cluster up and running with at least 3 or more nodes.

There are some decisions you need to make before deploying MinIO.
- How many MinIO instances do you want to deploy?
- How much storage do you want to allocate to each instance?

## IMPORTANT

This stack uses the `local` driver for the volumes. This means that the data will be stored on the local node. If you want to use a different driver, you need to create a volume name `minio-data` with the driver you want to use.

```sh
docker volume create --driver <driver> minio-data
```

If you wish to share data between machines, read here [Share data between machines](https://docs.docker.com/storage/volumes/#share-data-between-machines).
