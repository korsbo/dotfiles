## Install neovim
cd 
mkdir software
cd software
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
ln -s ${HOME}/software/nvim.appimage ${HOME}/bin/nvim
cd

## Install Antigen
mkdir --parents ${HOME}/.antigen/antigen
curl -L git.io/antigen > ${HOME}/.antigen/antigen/antigen.zsh




