# install terminator
if [ $os == "linux-gnu" ]; then
	sudo add-apt-repository ppa:gnome-terminator
	sudo apt-get update
	sudo apt-get install terminator
fi
