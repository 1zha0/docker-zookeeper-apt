# ZooKeeper 3.4 with daily `apt-get update & upgrade`

FROM zookeeper:3.4

# This build runs `apt-get update` against Docker official ZooKeeper image,
# to mitigate any known vulnerabilities due to gaps caused by
# offical image release cycle.

# Install required packages
RUN set -eux \
    && apt-get update \
    && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*; \
# Verify that gosu binary works
    gosu nobody true

USER zookeeper

# EOF
