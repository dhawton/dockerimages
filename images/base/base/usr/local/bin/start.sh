#!/bin/bash

function createDockerStdoutStderr() {
    # link stdout from docker
    if [[ -n "$LOG_STDOUT" ]]; then
        echo "Log stdout redirected to $LOG_STDOUT"
    else
        LOG_STDOUT="/proc/$$/fd/1"
    fi

    if [[ -n "$LOG_STDERR" ]]; then
        echo "Log stderr redirected to $LOG_STDERR"
    else
        LOG_STDERR="/proc/$$/fd/2"
    fi

    ln -f -s "$LOG_STDOUT" /docker.stdout
    ln -f -s "$LOG_STDERR" /docker.stderr
}

function runEntrypoints() {
  if [[ -d "$1" ]]; then
    cd $1
    for FILE in *.sh; do
      if [[ -f $FILE ]]; then
        echo "-> Executing ${FILE}"
        # run custom scripts, only once
        bash "$FILE" -H
      fi
    done
    cd ~
  fi
}

createDockerStdoutStderr

runEntrypoints /entrypoint.d

exec "$@"