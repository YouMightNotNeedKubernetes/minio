#!/bin/sh

echo "Waiting for MinIO to start..."
while ! curl -s http://minio:9000/minio/health/live > /dev/null; do sleep 1; done
