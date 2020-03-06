# install Dive Docker image viewer
if [ $os == "linux-gnu" ]; then
	wget https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb
	sudo apt install ./dive_0.9.2_linux_amd64.deb
	rm ./dive_0.9.2_linux_amd64.deb
fi

if [ $os == "darwin" ]; then
	brew install dive
fi
