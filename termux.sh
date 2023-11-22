#!/bin/bash
printf "    Hello!\nnow will start Installation \n\e[3mplease dont do Ctrl+c if you don't have any problems\0 \n"

printf "\nSetup storage\n"
termux-setup-storage

printf "update package and upgrade the package!\n\n"
apt update -y
apt upgrade -y

printf "\nFinished the installation \nNow will install depedencies needed\n\n"
apt install -y termux-api tur-repo neovim lua-language-server stylua git gh clang
apt install -y code-server

printf "Set configuration files"
mkdir $HOME/.config/code-server
printf "bind-addr: localhost:8900
auth: password
password: 123
cert: false
" > $HOME/.config/code-server/config.yaml

if command -v git &> /dev/null
then
  printf "Register git"

  # Prompt the user for name and email
  read -p "Enter your name: " name
  read -p "Enter your email: " email

  # Check if variables are defined
  if [[ -n "$name" && -n "$email" ]]; then
      # Register name and email in Git config
      git config --global user.name "$name"
      git config --global user.email "$email"
      printf "Git configuration updated with name: $name and email: $email\n"
  else
      printf "Name and email are required. Git configuration not updated.\n"
  fi

  printf "Depedencies are installed\nNow clone (neo)vim repos!"
  git clone https://github.com/DinkyTrady/nvim --depth=1 .config/nvim
fi

printf "\nGet .bashrc!"
curl -O https://raw.githubusercontent.com/DinkyTrady/bash/main/.bashrc

termux-reload-settings

printf "\nOpening (neo)vim!"
nvim
