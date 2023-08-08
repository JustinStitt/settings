#!/usr/bin/env bash
#
NUM_COMMITS=$1
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Need NUM_COMMITS for git rebase -i HEAD~\$NUM_COMMITS"
    exit 1
fi
GIT_SEQUENCE_EDITOR=/usr/bin/rebaser git rebase -i HEAD~$NUM_COMMITS
