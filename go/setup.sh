# install Go language

if [ -d "/usr/local/go" ]; then
	sudo rm -rf /usr/local/go
fi

GO_VERSION="1.10"

if [ $os == "linux-gnu" ]; then
	GO_ARCH="linux-amd64"
fi

if [ $os == "darwin" ]; then
	GO_ARCH="darwin-amd64"
fi

curl -o go.tar.gz https://dl.google.com/go/go$GO_VERSION.$GO_ARCH.tar.gz

sudo tar -C /usr/local -xzf go.tar.gz

rm go.tar.gz

#install Glide for go pkg management
if [ $os == "linux-gnu" ]; then
	sudo add-apt-repository ppa:masterminds/glide
	sudo apt-get update
	sudo apt-get install glide
fi

if [ $os == "darwin" ]; then
	brew install glide
fi

#append config to .zshrc
echo "export PATH=\$PATH:/usr/local/go/bin" >> $HOME/.zshrc
echo "export GOBIN=/usr/local/go/bin" >> $HOME/.zshrc
echo "export GOPATH=\$HOME/Documents/code/go" >> $HOME/.zshrc
