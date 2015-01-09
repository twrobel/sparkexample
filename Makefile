PROJECT = sparkexample
REGISTRY = registry.giantswarm.io
# The default company equeals to your username
COMPANY :=  $(shell swarm user)

build:
	docker build -t $(REGISTRY)/$(COMPANY)/$(PROJECT) .

test-database: build
	docker run --rm -p 5432:5432\
	 -e "POSTGRES_USER=mypostgresuser" -e "POSTGRES_PASSWORD=mysecretpassword"\
	 --name database postgres:latest

test-web: build	
	docker run --rm -p 4567:4567 -e "POSTGRES_USER=mypostgresuser" -e "POSTGRES_PASSWORD=mysecretpassword" --link database:database $(REGISTRY)/$(COMPANY)/$(PROJECT)

push: build
	docker push $(REGISTRY)/$(COMPANY)/$(PROJECT)

up: build
	swarm up --var=POSTGRES_PASSWORD=mysecretpassword --var=POSTGRES_USER=mypostgresuser --var=COMPANY=$(COMPANY)