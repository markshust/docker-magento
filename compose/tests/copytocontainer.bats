#!/usr/bin/env bats

load test_helpers/common.bash
load test_helpers/running_docker.bash

DUMMY_TEST_FILE_PATH="app/etc/test-file.txt"
DUMMY_TEST_INVALID_DIR="dev/invalid"
DUMMY_TEST_DIR="dev/test-dir"

setup() {
  cd "$(magento_docker_base_path)"
  bin/cli rm -f "${DUMMY_TEST_FILE_PATH}"
  bin/cli rm -rf "${DUMMY_TEST_DIR}"
}

@test 'copytocontainer: copy a single file to a nested directory' {
  cd "$(magento_docker_base_path)"
  touch "src/${DUMMY_TEST_FILE_PATH}"
  run bin/copytocontainer "${DUMMY_TEST_FILE_PATH}"
  run bin/cli ls -l $(dirname "${DUMMY_TEST_FILE_PATH}")
  [ "${status}" -eq 0 ]
  [[ "${lines[@]}" =~ 'test-file.txt' ]]
}

@test 'copytocontainer: copy a directory to a nested directory' {
  cd "$(magento_docker_base_path)"
  mkdir -p src/${DUMMY_TEST_DIR}
  touch src/${DUMMY_TEST_DIR}/file.1.txt
  touch src/${DUMMY_TEST_DIR}/file.2.txt
  run bin/copytocontainer ${DUMMY_TEST_DIR}
  run bin/cli ls -l ${DUMMY_TEST_DIR}
  echo "$output" >&3
  [ "${status}" -eq 0 ]
  [[ "${lines[1]} =~ 'file.1.txt' ]]
  [[ "${lines[2]} =~ 'file.2.txt' ]]
}

@test 'copytocontainer: show help on no arguments' {
  cd "$(magento_docker_base_path)"
  run bin/copytocontainer
  [ "${status}" -eq 0 ]
  [ "${output}" = "Please specify a directory or file to copy to container (ex. vendor, --all)" ]
}

@test 'copytocontainer: copy all files to a container' {
  cd "$(magento_docker_base_path)"
  run bin/copytocontainer --all
  [ "${status}" -eq 0 ]
}

@test "copytocontainer copy fails if parent directory doesn't exist" {
  cd "$(magento_docker_base_path)"
  mkdir -p src/${DUMMY_TEST_INVALID_DIR}
  touch src/${DUMMY_TEST_INVALID_DIR}/test-file.txt
  run bin/copytocontainer ${DUMMY_TEST_INVALID_DIR}/test-file.txt
  [ "${status}" -eq 1 ]
}
