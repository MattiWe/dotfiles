#!/bin/bash

var=( $(ip -f inet -br -o a) )
result=""
# for i in $(seq 1 "$(echo $var | wc -w)")
for i in $(seq 1 "${#var[@]}")
do
  if [[ "UP" == "${var[i]}" ]] ;
  then
    result="$result ${var[i-1]}"
  fi
done
echo $result
