#!/bin/bash

docker build -f Dockerfile . -t dotfiles-test

docker run --rm -it \
       --env DOTFILES_BRANCH=${DOTFILES_BRANCH:-master} \
       --mount "type=bind,source=$PWD/install_dotfiles.sh,target=/home/crossjam/install_dotfiles.sh" \
       --mount "type=bind,source=${SSH_KEY_PATH:-/home/crossjam/.ssh/id_ecdsa},target=/home/crossjam/.ssh/id_ecdsa" \
       dotfiles-test
