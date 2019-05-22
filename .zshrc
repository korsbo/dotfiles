#bindkey -v
export KEYTIMEOUT=1
# Path to your oh-my-zsh installation.
#export ZSH=/home/Niklas/.oh-my-zsh

source ~/.antigen/antigen/antigen.zsh

# Load the oh-my-zsh's library.



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"
#ZSH_THEME="avit"

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

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

DEBIAN_PREVENT_KEYBOARD_CHANGES="true"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(safe-paste, vi-mode, git, z, history)
#plugins=(vi-mode, git, z)

# User configuration

# export PATH="/home/Niklas/programs/anaconda3/bin:/nfs/bin:/home/Niklas/master/scripts:/home/Niklas/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/home/Niklas/projects/images/scripts:/home/Niklas/programs/clang/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04/bin"
export PATH="/home/Niklas/programs/anaconda3/bin:/nfs/bin:/home/Niklas/master/scripts:/home/Niklas/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/home/Niklas/projects/images/scripts"

# export PATH="/nfs/bin/:/home/william/b13_niklas/master/scripts:/home/william/b13_niklas/bin/:/home/william/b13_niklas/python/venv/base/bin:/nfs/bin/:/home/william/b13_niklas/master/scripts:/home/william/b13_niklas/bin/:/home/william/b13_niklas/python/venv/base/bin:/usr/lib64/mpi/gcc/openmpi/bin:/home/william/b13_niklas/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"
export PYTHONPATH=$PYTHONPATH:"/home/Niklas/home3/lib/python"

#source $ZSH/oh-my-zsh.sh
antigen use oh-my-zsh

source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/oh-my-zsh.sh

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


antigen bundle history
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle vi-mode
antigen bundle safe-paste





# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#source ~/.openalea.sh
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/programs/timagetk/timagetk/build-scons/lib
export PATH=$PATH:$HOME/.local/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias config='/usr/bin/git --git-dir=/home/Niklas/.cfg/ --work-tree=/home/Niklas'
