#!/bin/bash


# tail -f /tmp/yabai_$USER.err.log
log show --predicate 'process == "yabai"' --last 30m
