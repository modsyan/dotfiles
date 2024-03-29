if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

autoload -U promptinit; promptinit
autoload -U colors && colors
export PWD=/home/$USER
export OLDPWD=/home/$USER
export BAT_THEME="Nord"


# docker @modsyan
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# cargo add path
PATH="$PATH:/home/modsyan/.cargo/bin/"


# For NPM GLOBal Installation
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export KEYTIMEOUT=25
export ZSH=/usr/share/oh-my-zsh
# Load Version control information
autoload -Uz vcs_info
precmd() { vcs_info }

. /opt/asdf-vm/asdf.sh

# --------------------> now
# Format the vcs_info_msg_0_ variable
# zstyle ':vcs_info:git:*' formats "%b"
# ZSH_THEME_GIT_PROMPT_PREFIX=""
# ZSH_THEME_GIT_PROMPT_SUFFIX=""
# ZSH_THEME_GIT_PROMPT_DIRTY=" ✘"
# ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
# ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
# ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
# ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
# ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
# ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
# ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"

# setopt prompt_subst
# PROMPT="%F{011}%~ %F{060}%n@%m%F{010}"$'\n'" ❯ %f"
# RPROMPT='%F{060}${vcs_info_msg_0_}`git_prompt_status`'

# --------------------> end

# --------------------> off default
ZSH_THEME="codespaces"
# ZSH_THEME=random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "axyl" "codespaces" "fino-time" "half-life")
# ZSH_THEME_RANDOM_QUIET=true
# -------------------> end

# NNN_PLUGINS  -->> needed to be handled from plugins doc on github of nnn 
# NNN_PLUG_FINDER='f:finder;' 
# NNN_PLUG_OPEN='o:fzopen;'
# NNN_PLUG_MOCQ='p:mocq;'
# NNN_PLUG_DIFFS='d:diffs;'
# NNN_PLUG_MOUNT='t:nmount;'
# NNN_PLUG_IMG='v:imgview;'
# export NNN_PLUG="$NNN_PLUG_FINDER;$NNN_PLUG_OPEN;$NNN_PLUG_MOCQ;$NNN_PLUG_DIFFS;$NNN_PLUG_MOUNT;$NNN_PLUG_IMG"
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'

source $ZSH/oh-my-zsh.sh
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
HIST_STAMPS="dd/mm/yyyy"
compinit
_comp_options+=(globdots) # lets you tab complete hidden files by default

plugins=(
	git
	npm
  zsh-autosuggestions
	vi-mode
	zsh-syntax-highlighting
  bazel
  docker
  docker-compose
  gcloud
  kubectl
	)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

#colorscript -r
# neofetch
