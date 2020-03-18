# ZooKeeper with daily `apt-get update & upgrade`

This is a clone of Dockerfile for [ZooKeeper 3.4 & 3.5](https://zookeeper.apache.org/) with `apt-get update & upgrade` applied.

## Tags

- latest-apt
- 3.4-apt
- 3.5-apt

## Testing

Tests are defined in `test-image.yaml` using [GoogleContainerTools/container-structure-test](
https://github.com/GoogleContainerTools/container-structure-test). To run tests, execute `./test-image.sh`. 

## Usage

Please refer to [storm](https://hub.docker.com/_/storm/).
