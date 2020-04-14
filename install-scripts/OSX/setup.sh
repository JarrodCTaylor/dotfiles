#==============
# Install all the packages
#==============

# Update /usr/local path ownership to current user
sudo chown -R $(whoami):admin /usr/local

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update

# Ensure we use all of the packages we are about to install
echo "export PATH='/usr/local/bin:$PATH'\n" >> ~/.bashrc
source ~/.bashrc

#==============
# Remove old dot flies
#==============
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zsh_prompt > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.psqlrc > /dev/null 2>&1
sudo rm -rf ~/.tigrc > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1
sudo rm -rf ~/Brewfile > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir with the -f flag
#==============
SYMLINKS=()
ln -sf ~/dotfiles/vim ~/.vim
SYMLINKS+=('.vim')
ln -sf ~/dotfiles/vimrc ~/.vimrc
SYMLINKS+=('.vimrc')
ln -sf ~/dotfiles/bashrc ~/.bashrc
SYMLINKS+=('.bashrc')
ln -sf ~/dotfiles/mac-tmux ~/.tmux
SYMLINKS+=('.tmux')
ln -sf ~/dotfiles/zsh/zsh_prompt ~/.zsh_prompt
SYMLINKS+=('.zsh_prompt')
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
SYMLINKS+=('.zshrc')
ln -sf ~/dotfiles/config ~/.config
SYMLINKS+=('.config')
ln -sf ~/dotfiles/custom-configs/custom-snips ~/.vim/custom-snips
SYMLINKS+=('.vim/custom-snips')
ln -sf ~/dotfiles/homebrew/Brewfile ~/Brewfile
SYMLINKS+=('Brewfile')
ln -s ~/dotfiles/gitconfig ~/.gitconfig
SYMLINKS+=('.gitconfig')
ln -s ~/dotfiles/mac-tmux/tmux.conf ~/.tmux.conf
SYMLINKS+=('.tmux.conf')
ln -s ~/dotfiles/tigrc ~/.tigrc
SYMLINKS+=('.tigrc')
ln -s ~/dotfiles/psqlrc ~/.psqlrc
SYMLINKS+=('.psqlrc')

echo "The following symlinks have been created:\n ${SYMLINKS[@]}"

# hack for... I'm not even sure what... sqlite working in Python with pyenv?
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

cd ~
brew bundle
cd -

#==============
# Set zsh as the default shell
#==============
chsh -s /bin/zsh

#==============
# Setup nvim plugin installer
#==============
mkdir -p ~/.local

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ../../custom-configs/init.vim ~/.config/nvim/init.vim

#==============
# And we are done
#==============
echo -e "\n====== All Done!! ======\n"
