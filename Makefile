SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

build: # Build defn/etcd
	docker build -t defn/etcd .

push: # Push defn/etcd
	docker push defn/etcd

bash: # Run bash shell with defn/etcd
	docker run --rm -ti --entrypoint bash defn/etcd

clean:
	docker-compose down --remove-orphans

up:
	docker-compose up -d --remove-orphans

down:
	docker-compose rm -f -s

recreate:
	$(MAKE) clean
	$(MAKE) up

logs:
	docker-compose logs -f
