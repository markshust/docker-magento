#!/usr/bin/env bats

load test_helpers/common.bash
load test_helpers/running_docker.bash

@test 'n98-magenrun2: db:info host' {
  run "$(magento_docker_base_path)"/bin/n98-magerun2 db:info host
  echo "$output"
  [ "$status" -eq 0 ]
  [[ "${lines[0]}" =~ "db" ]]
}
