#!/bin/bash

# Library of commonly used Bash functions

function errorAndExit() {
    echo $1
    exit $2   
}

function exportSettings () {
  for key in "${!SETTINGS[@]}"; do
    export ${key}=${SETTINGS[$key]}
  done
}

function promptUser () {
  echo -ne "\e[31m$1: \e[0m" 
  read var
  SETTINGS[${2}]="${var}"
  if [[ -z "${SETTINGS[${2}]}" ]]; then
    promptUser "${1}" "${2}"
  fi
}

