#!/usr/bin/env bats

DOCKER_ROOT_PATH="${BATS_TEST_DIRNAME}/.."
DUMMY_TEST_FILE_PATH="dev/tests/test-file.txt"
DUMMY_TEST_DIR="dev/test-dir"


setup_file() {
  cd ${DOCKER_ROOT_PATH} && bin/start
}

setup() {
  cd $DOCKER_ROOT_PATH
  bin/cli rm -f ${DUMMY_TEST_FILE_PATH}
  bin/cli rm -rf ${DUMMY_TEST_DIR}
}

teardown_file() {
  cd ${DOCKER_ROOT_PATH} && bin/stop
}

@test 'copy a single file to a nested directory' {
  cd ${DOCKER_ROOT_PATH}
  touch src/${DUMMY_TEST_FILE_PATH}
  run bin/copytocontainer ${DUMMY_TEST_FILE_PATH}
  run bin/cli ls ${DUMMY_TEST_FILE_PATH}
  [ "${status}" -eq 0 ]
}

@test 'copy a directory to a nested directory' {
  cd ${DOCKER_ROOT_PATH}
  mkdir -p src/${DUMMY_TEST_DIR}
  touch src/${DUMMY_TEST_DIR}/file.1.txt
  touch src/${DUMMY_TEST_DIR}/file.2.txt
  run bin/copytocontainer ${DUMMY_TEST_DIR}
  run bin/cli ls ${DUMMY_TEST_DIR}
  [ "${status}" -eq 0 ]
}

@test 'copytocontainer show help on no arguments' {
  cd ${DOCKER_ROOT_PATH}
  run bin/copytocontainer
  [ "${status}" -eq 0 ]
  [ "${output}" = "Please specify a directory or file to copy to container (ex. vendor, --all)" ]
}

@test 'copy all files to a container' {
  cd ${DOCKER_ROOT_PATH}
  run bin/copytocontainer --all
  [ "${status}" -eq 0 ]
}
