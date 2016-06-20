# clean existing
rm ~/.zshrc
rm -rf ~/.oh-my-zsh

# install zsh

# install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# remove git files/folders
(find ~/.oh-my-zsh -type d -name ".git" && find ~/.oh-my-zsh -name ".gitignore" && find ~/.oh-my-zsh -name ".gitmodules" ) | xargs rm -rf

# .zshrc
cp .zshrc ~/.zshrc

# theme
cp ./themes/ryan.zsh-theme ~/.oh-my-zsh/themes/ryan.zsh-theme

# change default shell to zsh
chsh -s /bin/zsh

