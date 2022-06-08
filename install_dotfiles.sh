#!/bin/bash
export NONINTERACTIVE=t
export DEBIAN_FRONTEND=noninteractive

PYTHONUSERBASE=$HOME/.local /usr/bin/python3 -m pip install pipx
PATH=$HOME/.local/bin:$PATH
pipx install homely
homely add dotfiles
unset GIT_SSH_COMMAND

