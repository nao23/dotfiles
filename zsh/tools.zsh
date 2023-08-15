# some tool specific configuration
## fzf
export FZF_DEFAULT_OPTS='--layout=reverse --no-sort --exact'
## bat
export BAT_STYLE='plain'
export BAT_THEME='base16'
export BAT_PAGER='never'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
## delta
export DELTA_PAGER='less'
## findutils/coreutils
export PATH=/usr/local/opt/findutils/libexec/gnubin:${PATH}
export MANPATH=/usr/local/opt/findutils/libexec/gnuman:${MANPATH}
export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
## direnv
export DIRENV_WARN_TIMEOUT=100s
## poetry
export PATH="$HOME/.local/bin:$PATH"
