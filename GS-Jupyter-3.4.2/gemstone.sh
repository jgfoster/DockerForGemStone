#!/usr/bin/env bash

# based on https://medium.com/@gchudnov/trapping-signals-in-docker-containers-7a57fdda7d86
# see also https://docs.docker.com/engine/reference/builder/#exec-form-entrypoint-example

set -x

# SIGUSR1-handler
my_handler() {
  echo 'my_handler'
}

# SIGTERM-handler
term_handler() {
  echo 'term_handler'
  stopnetldi
  stopstone -i gs64stone DataCurator swordfish
  exit 143; # 128 + 15 -- SIGTERM
}

# setup handlers
# on callback, kill the last background process, 
# which is `tail -f /dev/null` and execute the specified handler
trap 'kill ${!}; my_handler' SIGUSR1
trap 'kill ${!}; term_handler' SIGTERM

# start GemStone services
startnetldi -g -a jovyan -P 50377 -n -N
startstone -e $GEMSTONE_EXE_CONF -l $GEMSTONE_LOG -z $GEMSTONE_SYS_CONF

gslist -cvl			# list GemStone servers

start-notebook.sh
