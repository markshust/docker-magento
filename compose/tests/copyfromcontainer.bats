#!/usr/bin/env bats

load test_helpers/common.bash
load test_helpers/running_docker.bash

DUMMY_TEST_FILE_PATH="dev/tests/test-file3.txt"

setup() {
  rm -f "$(magento_docker_base_path)/src/$DUMMY_TEST_FILE_PATH"
}

@test 'copyfromcontainer: show help on no arguments' {
  run "$(magento_docker_base_path)"/bin/copyfromcontainer
  [ "${status}" -eq 0 ]
  [ "${output}" = "Please specify a directory or file to copy from container (ex. vendor, --all)" ]
}

@test 'copyfromcontainer: copy a single file from a nested directory' {
  "$(magento_docker_base_path)"/bin/clinotty touch "$DUMMY_TEST_FILE_PATH"
  run "$(magento_docker_base_path)"/bin/copyfromcontainer "$DUMMY_TEST_FILE_PATH"
  run ls -l "$(magento_docker_base_path)"/src/"$(dirname "${DUMMY_TEST_FILE_PATH}")"
  [ "${status}" -eq 0 ]
  [[ "${lines[@]}" =~ $(basename "${DUMMY_TEST_FILE_PATH}") ]]
}
