# Common
export ZSHDIR="$(dirname $(readlink ${(%):-%N}))/zsh"
source $ZSHDIR/common.zsh

# Zinit
## initialization
ZINIT_HOME=$HOME/.local/share/zinit/zinit.git
if [[ ! -d $ZINIT_HOME ]]; then
    sh -c "$(curl -fsSL https://git.io/zinit-install)"
fi
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## plugins
### Completions
zinit light chr-fritz/docker-completion.zshplugin
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
#### NOTE: fzf-tab needs to be loaded after compinit, but before plugins which will wrap widgets, such as fast-syntax-highlighting!!
zinit light Aloxaf/fzf-tab 

### Syntax
zinit light zdharma-continuum/fast-syntax-highlighting

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
zinit ice from"gh-r" as"program" pick"bin/exa"
zinit light ogham/exa
zinit ice from"gh-r" as"program" mv"delta* -> delta" pick"delta/delta"
zinit light dandavison/delta

### Aliases
zinit snippet 'OMZ::plugins/git/git.plugin.zsh'
zinit light djui/alias-tips

# direnv
eval "$(direnv hook zsh)"

# asdf
source $(brew --prefix asdf)/asdf.sh

# Load other custom configuration
source $ZSHDIR/tools.zsh
source $ZSHDIR/aliases.zsh
source $ZSHDIR/bindkeys.zsh

