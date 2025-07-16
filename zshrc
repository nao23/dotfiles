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
#### NOTE: fzf-tab needs to be loaded after compinit, but before plugins which will wrap widgets, such as fast-syntax-highlighting!!
zinit light Aloxaf/fzf-tab 

### Syntax
zinit light zdharma-continuum/fast-syntax-highlighting

### Utils
zinit light mollifier/anyframe

### Aliases
zinit snippet 'OMZ::plugins/git/git.plugin.zsh'
zinit light djui/alias-tips

# direnv
eval "$(direnv hook zsh)"

# starship
eval "$(starship init zsh)"

# Load other custom configuration
source $ZSHDIR/tools.zsh
source $ZSHDIR/aliases.zsh
source $ZSHDIR/bindkeys.zsh

for f in $ZSHDIR/local/*.zsh; do
    source $f
done

### End of Zinit's installer chunk
