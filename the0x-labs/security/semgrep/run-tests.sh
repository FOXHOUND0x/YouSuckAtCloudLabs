#!/bin/bash

BASE_DIR="rules/cloud/aws/service"

run_semgrep_tests() {
    local rule_file=$1
    local test_dir=$2

    printf "Running tests for rule: %s\n" "$rule_file"

    for test_file in "$test_dir"/*.tf; do
        if [[ -f "$test_file" ]]; then
            printf "Testing %s\n" "$test_file"
            semgrep --config "$rule_file" "$test_file" && \
                printf "Test passed for %s\n" "$test_file" || \
                printf "Test failed for %s\n" "$test_file" &
        fi
    done
    wait
}

export -f run_semgrep_tests

find "$BASE_DIR" -mindepth 3 -maxdepth 3 -type f -name "*.yml" -exec bash -c '
    rule_file="$1"
    rule_dir=$(dirname "$rule_file")
    test_dir="$rule_dir/tests"

    if [[ -d "$test_dir" ]]; then
        run_semgrep_tests "$rule_file" "$test_dir"
    else
        printf "No test directory found for rule: %s\n" "$rule_file"
    fi
' bash {} \;
