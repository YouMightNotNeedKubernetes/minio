> [!IMPORTANT]
> Use this as a starting point for your own deployment. It is not recommended to use this in production as it only provides as simple deployment strategies.

# minio
Docker Stack deployment for MinIO Object Storage.

It supports both single and distributed deployments. It uses Docker volumes to store the data. And ensure the server is spread evenly across the nodes.

## Getting Started

As a recommendation, you should only have MinIO deployed per Docker Swarm Cluster.

## Deployment Modes

There are 2 deployment modes for MinIO.
- Single
- Distributed

### Deploy a single environment

Before you can deploy MinIO, you need to have a Docker Swarm Cluster up and running with at least 1 or more nodes.

> [!NOTE]
> Placements constraints & preferences are used to ensure that only one replica is deployed per node.

See `docker-compose.single.yml` as an example.

### Deploy a distributed environment

Before you can deploy MinIO, you need to have a Docker Swarm Cluster up and running with at least 3 or more nodes.

There are some decisions you need to make before deploying MinIO.
- How many MinIO instances do you want to deploy?
- How much storage do you want to allocate to each instance?

> [!NOTE]
> Placements constraints & preferences are used to ensure that the servers are spread evenly across the nodes and only one replica is deployed per node.

See `docker-compose.distributed.yml` as an example.

## IMPORTANT

### Server placement

A `node.labels.minio` label is used to determine which nodes the MinIO server can be deployed on.

The deployment uses both placement **constraints** & **preferences** to ensure that the servers are spread evenly across the nodes and only **ALLOW** one replica per node.

![placement_prefs](https://docs.docker.com/engine/swarm/images/placement_prefs.png)

> See https://docs.docker.com/engine/swarm/services/#control-service-placement for more information.

#### List the nodes
On the manager node, run the following command to list the nodes in the cluster.

```sh
docker node ls
```

#### Add the label to the node
On the manager node, run the following command to add the label to the node.

Repeat this step for each node you want to deploy MinIO to.

```sh
docker node update --label-add minio=true <node-name>
```

### Storage

This stack uses the `local` driver for the volumes by default. This means that the data will be stored on the local node.

If you want to use a different driver, you need to create a volume name `minio-data` with the driver you want to use.

Here is an example of creating a volume with the `local` driver:
```sh
# You can specify the driver with the --driver local flag or omit it as it is the default driver.
docker volume create minio-data
```

> See https://docs.docker.com/engine/reference/commandline/volume_create/ for more information.

If you wish to share data between machines, read here [Share data between machines](https://docs.docker.com/storage/volumes/#share-data-between-machines).

**Example**: Distributed deployment

This is the official diagram from MinIO on how to deploy a distributed environment.

In this example, the `SERVER n` is the number of nodes you have in your Docker Swarm Cluster (See: [Server placement](#server-placement) for details on how MinIO deployed to each node).

![diagram_distributed_nm](https://raw.githubusercontent.com/minio/minio/master/docs/screenshots/Architecture-diagram_distributed_nm.png)
