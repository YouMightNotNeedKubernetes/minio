docker_stack_name := minio
mode := distributed
service_replicas := 3
compose_files := -c docker-compose.yml -c docker-compose.${mode}.yml

it:
	@echo "make mode=$(mode) [deploy|destroy]"

plan:
	docker stack config $(compose_files)

deploy:
	docker stack deploy $(compose_files) ${docker_stack_name}_${mode}

destroy:
	docker stack rm ${docker_stack_name}_${mode}
