# dotfiles
[crossjam](https://github.com/crossjam) specific startup files for
various operating systems, shells, and applications.

This branch is specific to installing from a work environment login
with just enough support to install and maintain these dotfiles.

For the `ssh -i foo.pub` to work, the corresponding private key has to
have been added to an `ssh-agent`. Apparently there’s some magic where
the agent uses the pubkey to lookup the corresponding private key. If
the private key isn’t added then `ssh` thinks the pubkey is a
malformed private key.

## Bootstrapping

Assuming `ssh -T git@github.com` auths as `crossjam`

```
# From the local machine, assume crossjam_host.pub auths as crossjam
scp ~/.ssh/crossjam_local_host.pub bdennis@remote_host.example:.ssh/

# Now to the remote machine
$ ssh -A bdennis@remote_host.example
$ export GIT_SSH_COMMAND="ssh -i ~/.ssh/crossjam_local_host.pub -o IdentitiesOnly=yes"
$ git clone git@github.com:crossjam/dotfiles.git
$ cd dotfiles
$ git checkout -b bmdmc origin/bmdmc
$ cd ..
$ mkdir venv
$ python3 -m venv ~/venv/homely
$ source ~/venv/homely/bin/activate
$ python3 -m pip install homely
$ bash dotfiles/install_dotfiles.sh

# edit .gitconfig.crossjam to point to the crossjam_host.pub key
```

## Bootstrapping to a remote machine

Assuming there’s already an account setup `bdennis@remote_host.example.com`, with the
`.ssh` directory existing.

```
# From the local machine, assume crossjam_dotfiles.pub auths as
# crossjam on GitHub
$ scp ~/.ssh/crossjam_dotfiles.pub bdennis@remote_host.example.com:.ssh/

# Now to the remote machine
$ ssh -A bdennis@remote_host.example
$ export GIT_SSH_COMMAND="ssh -i ~/.ssh/crossjam_dotfiles.pub -o IdentitiesOnly=yes"
$ git clone git@github.com:crossjam/dotfiles.git
$ bash ./dotfiles/install_dotfiles.sh

# To support editing, push, and pull of the dotfiles repo
# edit .gitconfig.crossjam to point to the crossjam_dotfiles.pub key
```
