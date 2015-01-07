PROJECT = sparkexample
REGISTRY = registry.giantswarm.io
COMPANY = giantswarm

build:
	docker build -t $(REGISTRY)/$(COMPANY)/$(PROJECT) .

run:
	docker run -p 4567:4567 $(REGISTRY)/$(COMPANY)/$(PROJECT)
