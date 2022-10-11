DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := $(shell git rev-parse --abbrev-ref HEAD)
build:
	docker build -t akshay/hadoop-base:$(current_branch) ./base
run:
	docker run -d -p 2022:22 -p 50070:50070 akshay/hadoop-base:HEAD
