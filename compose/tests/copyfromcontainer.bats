#!/usr/bin/env bats

DOCKER_ROOT_PATH="${BATS_TEST_DIRNAME}/.."

setup_file() {
  cd ${DOCKER_ROOT_PATH} && bin/start
}

teardown_file() {
  cd ${DOCKER_ROOT_PATH} && bin/stop
}

@test 'copyfromcontainer show help on no arguments' {
  cd ${DOCKER_ROOT_PATH}
  run bin/copyfromcontainer
  [ "${status}" -eq 0 ]
  [ "${output}" = "Please specify a directory or file to copy from container (ex. vendor, --all)" ]
}
