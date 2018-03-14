# install terminator
if [ $os == "linux-gnu" ]; then
	if ! [ -x "$(command -v terminator)" ]; then
		sudo add-apt-repository ppa:gnome-terminator
		sudo apt-get update
		sudo apt-get install terminator
	fi

	if [ -f ~/.config/terminator/config ]; then
		rm ~/.config/terminator/config
	fi

	cp ./terminal/terminator-config ~/.config/terminator/config
fi
