case $(uname -a) in
   *Microsoft*) unsetopt BG_NICE ;;
esac

#bindkey -v
export KEYTIMEOUT=1
# Path to your oh-my-zsh installation.
#export ZSH=/home/Niklas/.oh-my-zsh

source ~/.antigen/antigen/antigen.zsh
 
antigen use oh-my-zsh
antigen theme avit

antigen bundle history
antigen bundle z
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle vi-mode
antigen bundle safe-paste


antigen apply

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Load the oh-my-zsh's library.



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# if a command starts with a space, do not add it to the command history.
setopt HIST_IGNORE_SPACE

DEBIAN_PREVENT_KEYBOARD_CHANGES="true"

# User configuration

# export PATH="/home/Niklas/programs/anaconda3/bin:/nfs/bin:/home/Niklas/master/scripts:/home/Niklas/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/home/Niklas/projects/images/scripts:/home/Niklas/programs/clang/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04/bin"
export PATH="/home/Niklas/programs/anaconda3/bin:/nfs/bin:/home/Niklas/master/scripts:/home/Niklas/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/home/Niklas/projects/images/scripts"

# export PATH="/nfs/bin/:/home/william/b13_niklas/master/scripts:/home/william/b13_niklas/bin/:/home/william/b13_niklas/python/venv/base/bin:/nfs/bin/:/home/william/b13_niklas/master/scripts:/home/william/b13_niklas/bin/:/home/william/b13_niklas/python/venv/base/bin:/usr/lib64/mpi/gcc/openmpi/bin:/home/william/b13_niklas/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"
export PYTHONPATH=$PYTHONPATH:"/home/Niklas/home3/lib/python"


export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help:rm -r";
alias g="gvim --remote-silent"
alias l="ls -v"
alias acs="apt-cache search"

alias ros="cd ~/home3/projects/ros_adaptation/"
alias clv="cd ~/home3/projects/clv1_precise_adaptation/"
alias lib="cd ~/.julia/v0.6/Libs/"
alias proj="cd ~/home3/projects/"

#source ~/.openalea.sh
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/programs/timagetk/timagetk/build-scons/lib
export PATH=$PATH:$HOME/.local/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias config='/usr/bin/git --git-dir=$(echo ~)/.cfg/ --work-tree=$(echo ~)'
alias svim='nvim -u ~/.SpaceVim/vimrc'
export SHELL="/usr/bin/zsh"

