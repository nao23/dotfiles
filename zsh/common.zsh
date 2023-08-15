# Common
export EDITOR=vim
export VISUAL=vim
export HISTFILE=$HOME/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000
setopt auto_cd
setopt auto_param_keys
setopt auto_param_slash
setopt list_types
setopt nobeep
setopt nolistbeep
setopt magic_equal_subst
setopt mark_dirs
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_no_store
setopt no_flow_control
autoload -U compinit
compinit
autoload -Uz edit-command-line
zle -N edit-command-line
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
