# clean existing
rm ~/.zshrc
rm -rf ~/.oh-my-zsh

# install zsh
if [ $os == "linux-gnu" ]; then
	sudo apt-get install zsh
fi

# install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# .zshrc
cp ./zsh/.zshrc ~/.zshrc

# theme
cp ./zsh/themes/ryan.zsh-theme ~/.oh-my-zsh/themes/ryan.zsh-theme

# change default shell to zsh
chsh -s /bin/zsh

