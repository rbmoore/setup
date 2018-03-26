# install task warrior
if [ $os == "linux-gnu" ]; then
	sudo apt-get install task
fi

if [ $os == "darwin" ]; then
	brew install task
fi
