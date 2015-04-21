PROJECT = sparkexample
REGISTRY = registry.giantswarm.io
# Insert your company
COMPANY = giantswarm

build:
	docker build -t $(REGISTRY)/$(COMPANY)/$(PROJECT) .
	docker run -v ${PWD}/target:/target $(REGISTRY)/$(COMPANY)/$(PROJECT) cp target/sparkexample-jar-with-dependencies.jar /target
	docker build -f Dockerfile-run -t $(REGISTRY)/$(COMPANY)/$(PROJECT)-run .

push:
	docker push $(REGISTRY)/$(COMPANY)/$(PROJECT)

run:
	docker run -p 4567:4567 $(REGISTRY)/$(COMPANY)/$(PROJECT)-run
