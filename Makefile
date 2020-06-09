SHELL := /bin/bash

DOCKER := $(shell command -v npm 2> /dev/null)
ifndef DOCKER
	$(error docker is not available on your system, please install docker)
endif
NODE_CONTAINER ?= "node:8"

.PHONY: install
install:
	docker run --rm -v $(CURDIR):/app -w /app $(NODE_CONTAINER) npm install

.PHONY: clean
clean:
	docker run --rm -v $(CURDIR):/app -w /app $(NODE_CONTAINER) npm run clean

.PHONY: build
build:
	docker run --rm -v $(CURDIR):/app -w /app $(NODE_CONTAINER) npm run build

.PHONY: start
start:
	docker run --rm -v $(CURDIR):/app -w /app -p 3000:3000 -e HOST="0.0.0.0" $(NODE_CONTAINER) npm run start
