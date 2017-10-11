export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
SSH_KEY_PATH="~/.ssh/id_rsa"
SOBOLE_THEME_MODE=dark

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

# zplug init! 
source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# zplug "~/.zshrc.local", from:local
# zplug "~/.aliases", from:local

# zsh plugins
zplug "rimraf/k"
zplug "djui/alias-tips"
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

# oh-my-zsh plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh

# theme <3
zplug "sobolevn/sobole-zsh-theme", as:theme

if ! zplug check; then
    zplug install
fi

zplug load

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# load Go Lang
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# aliases
# [[ -f ~/.aliases ]] && source ~/.aliases

# Local config
#[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

#AWSume alias to source the AWSume script
alias awsume=". awsume"

