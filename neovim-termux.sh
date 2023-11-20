echo "Setup storage"
termux-setup-storage

echo "Update/upgrade package and installing depedencies that needed"
apt update -y && apt upgrade -y && apt install git neovim ripgrep nodejs-lts clang lua-language-server -y
echo "Finished installation!"

echo "Now clone the repo and open neovim"
git clone https://github.com/DinkyTrady/nvim --depth=1 ~/.config/nvim && nvim
