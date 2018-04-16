#vim: set ft=makefile:

SHELL        := bash
MAKEFLAGS    += --warn-undefined-variables
.DEFAULT_GOAL = all

toolchain   = docker
.toolchain := $(foreach cmd,$(toolchain), $(if $(shell which $(cmd)),,$(error "Unable to find required '$(cmd)' on your $$PATH")))

docker      = $(shell command -v docker 2> /dev/null)
docker_args =

docker_files   := $(shell find . -mindepth 1 -type f -name Dockerfile)
docker_targets := $(subst ./,,$(subst /Dockerfile,,$(docker_files))) $(subst ./,,$(subst /Dockerfile,/,$(docker_files)))

all: $(docker_targets)
.PHONY: all

build: pre-build .docker-build post-build
.PHONY: build

pre-build:
.PHONY: pre-build

.docker-build:
	@set -euxo pipefail && \
    $(docker) build -t "${IMAGE_NAME}:${IMAGE_VERSION}" \
    $(patsubst %,--build-arg %,$(BUILD_ARGS)) \
    --squash .
.PHONY: .docker-build

post-build:
.PHONY: post-build

$(docker_targets):
	$(MAKE) -C "${@}" build
.PHONY: $(docker_targets)
