#!/usr/bin/env bats

setup() {
    export SCRIPT="./main.sh"
}

@test "script exists and is executable" {
    [ -x "$SCRIPT" ]
}

@test "help flag displays usage" {
    run "$SCRIPT" --help
    [ "$status" -eq 0 ]
    [[ "$output" =~ "USAGE" ]]
}

@test "invalid flag shows error" {
    run "$SCRIPT" --invalid
    [ "$status" -eq 1 ]
    [[ "$output" =~ "Unknown option" ]]
}