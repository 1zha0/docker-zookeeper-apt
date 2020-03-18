#!/bin/bash

set -o pipefail -e

# TEMPLATES
# Dockerfile.zookeeper-apt.tpl

ZOOKEEPER_VERSIONS=(3.4 3.5)
SUFFIX="apt"

gen_dockerfile() {
  DOCKERFILE_TEMPLATE="Dockerfile.zookeeper-apt.tpl"

  DOCKERFILE_TARGET="${ZOOKEEPER_VERSION}-${SUFFIX}/Dockerfile"

  DOCKERFILE_TARGET_DIR="$(dirname ${DOCKERFILE_TARGET})"
  echo -en "Generating Dockerfile for ${ZOOKEEPER_VERSION}.. "
  if [ ! -r ${DOCKERFILE_TEMPLATE} ]; then
    echo "failed"
    echo "Missing Dockerfile template ${DOCKERFILE_TEMPLATE}"
    exit 1
  fi

  # create target dockerfile dir
  if [ ! -e ${DOCKERFILE_TARGET_DIR} ]; then
    mkdir -p ${DOCKERFILE_TARGET_DIR}
  fi

  sed "s/%ZOOKEEPER_VERSION%/${ZOOKEEPER_VERSION}/g;" \
    ${DOCKERFILE_TEMPLATE} > ${DOCKERFILE_TARGET} && \
  echo "done" || \
  echo "failed"
}

for version in ${ZOOKEEPER_VERSIONS[@]}; do
  ZOOKEEPER_VERSION=$(echo $version)

  gen_dockerfile

done

echo -n "Generating symlinks for current versions.. "
latest_version=$(echo "${ZOOKEEPER_VERSIONS[@]}" | tr ' ' '\n\' | uniq | sort -n | tail -n1)
latest="${latest_version}-${SUFFIX}"
[ -e current ] && rm current || true
ln -s ${latest} current
echo "done"
