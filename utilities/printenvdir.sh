#!/bin/bash

for item in $1/*
do
  if [ -f "$item" ]; then
    file=$(basename $item)
    echo -e "$file"
    printf "\t%s\n" $(cat "$item")
    printf "%`tput cols`s" | tr ' ' '#'
    printf "\n\n"
  fi
done
