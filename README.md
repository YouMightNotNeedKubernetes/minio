# minio
Docker Stack deployment for MinIO Object Storage.

```sh
docker node update --label-add minio.node=1

docker volume create --driver local --opt device=/mnt/data/minio --opt o=bind minio_data
```

## Getting Started

As a recommendation, you should only have MinIO deployed per Docker Swarm Cluster.
