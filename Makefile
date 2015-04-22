PROJECT = sparkexample
REGISTRY = registry.giantswarm.io
# Insert your company
COMPANY = giantswarm

build:
	# Build the build container. See Dockerfile.
	docker build -t $(REGISTRY)/$(COMPANY)/$(PROJECT) .
	# Copy the builded fat jar from the build container target.
	docker run -v ${PWD}/target:/target $(REGISTRY)/$(COMPANY)/$(PROJECT) cp target/sparkexample-jar-with-dependencies.jar /target
	# Build the run container and copies the fat jar into the run container. See Dockerfile-run.
	docker build -f Dockerfile-run -t $(REGISTRY)/$(COMPANY)/$(PROJECT)-run .

push:
	docker push $(REGISTRY)/$(COMPANY)/$(PROJECT)

run:
	docker run -p 4567:4567 $(REGISTRY)/$(COMPANY)/$(PROJECT)-run
