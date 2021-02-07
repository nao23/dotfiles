export ZSHDIR="$(dirname $(readlink ${(%):-%N}))/zsh"

# Zinit
## initialization
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## plugins
### Syntax
zinit light zdharma/fast-syntax-highlighting

### Utils
zinit light mollifier/anyframe

### Prompt
zinit ice from"gh-r" as"program" pick"**/starship" atload"eval \$(starship init zsh)"
zinit light starship/starship

### Program
zinit ice from"gh-r" as"program" pick'ghq*/ghq'
zinit light x-motemen/ghq
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf-bin
zinit ice as"command" from"gh-r" pick"bat*/bat"
zinit light sharkdp/bat
zinit ice from"gh-r" as"program" mv"exa*->exa" pick"exa*/exa"
zinit light ogham/exa
zinit ice from"gh-r" as"program" mv"delta* -> delta" pick"delta/delta"
zinit light dandavison/delta

### Aliases
zinit snippet 'OMZ::plugins/git/git.plugin.zsh'
zinit light djui/alias-tips

### Completions
zinit light zsh-users/zsh-completions

# direnv
eval "$(direnv hook zsh)"

# Load other custom configuration
source $ZSHDIR/common.zsh
source $ZSHDIR/tools.zsh
source $ZSHDIR/aliases.zsh
source $ZSHDIR/bindkeys.zsh

