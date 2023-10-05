#!/bin/sh

echo "Waiting for MinIO to start..."
while ! curl -s http://minio:9000 > /dev/null; do sleep 1; done
