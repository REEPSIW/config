cp ~/config/.vimrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Please run :PlugInstall in vim."
vim
mkdir ~/.vim/colors && mv ~/config/molokai.vim ~/.vim/colors
cp ~/config/coc-settings.json .vim
rm ~/.vim/plugged/vim-lightline-coc/autoload/lightline/coc.vim
cp ~/config/coc.vim ~/.vim/plugged/vim-lightline-coc/autoload/lightline/
rm ~/.vim/plugged/lightline.vim/autoload/lightline/colorscheme/one.vim
cp ~/config/one.vim  ~/.vim/plugged/lightline.vim/autoload/lightline/colorscheme/
rm ~/.vim/plugged/rainbow/autoload/rainbow_main.vim
cp ~/config/rainbow_main.vim ~/.vim/plugged/rainbow/autoload/

