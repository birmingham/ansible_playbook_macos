#!/usr/bin/env bash

#############################################################################################################################################
#
# Important:  Ssh keys added to your Github account are required to make this script run successfully.
# Please see https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
#
#############################################################################################################################################

set -o errexit
set -o errtrace
set -o nounset

GIT_REPO="git@github.com:birmingham/ansible_playbook_macos.git"
TARGET_DIR="$HOME/birmingham_github/ansible_playbook_macos"

if ! xcode-select --print-path &> /dev/null; then
  echo "Installing Command Line Tools"

  # Prompt user to install the Command Line Tools
  xcode-select --install &> /dev/null

  # Wait until the Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  echo "Done"
else
  echo "Command Line Tools are already installed"
fi

if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Done"
else
  echo "Yaaaay! Homebrew is already installed!"
fi

if test ! $(which ansible); then
  echo "Installing Ansible"
  brew install ansible
  echo "Done"
else
  echo "Yaaaaay! Ansible is already installed!"
fi

if [ ! -d "$TARGET_DIR" ]; then
  echo "Cloning playbook repository..."
  echo
  echo "From: $GIT_REPO"
  echo
  echo "To: $TARGET_DIR"
  git clone $GIT_REPO "$TARGET_DIR"
else
  echo "The directory for the playbook repository is already in place!"
fi

echo "Changing directory to $TARGET_DIR then running ansible playbook"
cd "$TARGET_DIR"

echo "Running the ansible playbook..."
ansible-playbook setup.yml

echo "Install.sh COMPLETE!!!"
