#!/bin/sh

HOOKS_LOG_FILE=${HOOKS_LOG_FILE:-/hooks/hooks.log}
ACTION=$1
SCRIPT_FILE="/hooks/hook_script"
NOW=$(date +"%c")

if [ -x "$SCRIPT_FILE" ]; then
  echo "[$NOW] ($ACTION) Executing $SCRIPT_FILE" >> $HOOKS_LOG_FILE
  /bin/sh -c "$SCRIPT_FILE $ACTION"
else
  echo "[$NOW] ($ACTION) Can't execute $SCRIPT_FILE : Doesn't exist or not executable" >> $HOOKS_LOG_FILE
fi
