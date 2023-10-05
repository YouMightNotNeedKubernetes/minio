docker_stack_name := minio
service_replicas := 3

it:
	@echo "make [deploy|destroy]"

deploy:
	docker stack deploy -c docker-compose.yml ${docker_stack_name}

destroy:
	docker stack rm ${docker_stack_name}
