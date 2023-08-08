#!/usr/bin/env bash
#
NUM_COMMITS=$1
GIT_SEQUENCE_EDITOR=/usr/bin/rebaser git rebase -i HEAD~$NUM_COMMITS
