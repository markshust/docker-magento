#!/usr/bin/env bats

load test_helpers/common.bash
load test_helpers/running_docker.bash

@test 'copyfromcontainer show help on no arguments' {
  run "$(magento_docker_base_path)"/bin/copyfromcontainer
  echo "$output"
  [ "${status}" -eq 0 ]
  [ "${output}" = "Please specify a directory or file to copy from container (ex. vendor, --all)" ]
}
