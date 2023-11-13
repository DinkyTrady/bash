termux-setup-storage
apt update -y
apt upgrade -y
apt install tur-repo -y
apt install code-server -y
mkdir ~/.config/code-server
echo "bind-addr: 127.0.0.1:8900\nauth: none\npassword: 123\ncert: false" > ~/.config/code-server/config.yaml
