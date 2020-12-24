# ansible_playbook_macos
Ansible automation to install software on new/reinstalled Macbook

Advantages for me over using a shell script based setup

- I can run the playbook over and over again with the same results.
- Tasks are only executed when changes are needed.
- The documentation about what is done is right in the output,
  instead of only in the comments.
- When a task doesn't work anymore, for example after a new macOS release,
  I will know immediately which one and why.
- It helps me to improve my Ansible skills :)

My dotfiles are managed with [yadm](https://thelocehiliosan.github.io/yadm/)
and stored in a private git repository which is pulled in the first time
the playbook is run. The repository is private because it includes
sensitive data like private ssh keys and GitHub tokens. This approach
allows me to only need the login data of the dotfiles repo
provider when setting up a computer from scratch.

## Installation

### Automated

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/birmingham/ansible_playbook_macos/master/install.sh)"
```

### Manual

```bash
# Install Apple's Command Line Tools
xcode-select --install

# Install Homebrew (see http://brew.sh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install ansible
brew install ansible

# Clone this repository
https://github.com/AndreasBoehm/ansible-macos-playbook.git

# Run the playbook
ansible-playbook setup.yml
```

## Acknowledgements

This playbook is heavily inspired by
[Andreas Boehm's ansible-macos-playbook](https://github.com/AndreasBoehm/ansible-macos-playbook).
