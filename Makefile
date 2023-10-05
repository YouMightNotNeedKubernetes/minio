docker_stack_name := minio
service_mode := distributed
service_replicas := 3

include .env.$(service_mode)

it:
	@echo "make service_mode=$(service_mode) [deploy|destroy]"

deploy:
	docker stack deploy -c docker-compose.yml ${docker_stack_name}_${service_mode}

destroy:
	docker stack rm ${docker_stack_name}_${service_mode}
