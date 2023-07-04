#!/bin/bash

GIT_TAG="master"
OS_IMAGE="ubuntu-22.04"
TARGETPLATFORM="linux/amd64"
RUNNER_VERSION=2.305.0
RUNNER_CONTAINER_HOOKS_VERSION=0.1.3
DOCKER_VERSION=24.0.2
RUNNER_USER_UID=33333
DOCKER_GROUP_GID=33333

cd runner || exit 1

docker build \
    --build-arg TARGETPLATFORM="${TARGETPLATFORM}" \
    --build-arg RUNNER_VERSION="${RUNNER_VERSION}" \
    --build-arg RUNNER_CONTAINER_HOOKS_VERSION="${RUNNER_CONTAINER_HOOKS_VERSION}" \
    --build-arg DOCKER_VERSION="${DOCKER_VERSION}" \
    --build-arg RUNNER_USER_UID="${RUNNER_USER_UID}" \
    --build-arg DOCKER_GROUP_GID="${DOCKER_GROUP_GID}" \
    -f actions-runner-dind.${OS_IMAGE}.dockerfile \
    -t eu.gcr.io/gitpod-core-dev/dev/gha-runner:self-hosted-0 .
