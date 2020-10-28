# zsh
export ZSH=~/.oh-my-zsh
plugins=(git docker brew scala sbt python zsh-syntax-highlighting zsh-autosuggestions cp)

# install pure prompt
ZSH_THEME=""
fpath+=$HOME/.zsh/pure

source $ZSH/oh-my-zsh.sh

# initiate pure
autoload -U promptinit; promptinit
prompt pure

# alias
alias ll="exa -hal"

alias ,='cd ..'
alias ,,='cd ../..'
alias ,,,='cd ../../..'
alias ,,,,='cd ../../../..'
alias ,,,,,='cd ../../../../..'
alias ,,,,,,='cd ../../../../../..'
alias ,,,,,,,='cd ../../../../../../..'
alias ,,,,,,,,='cd ../../../../../../../..'

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# fzf configuration
FZF_DEFAULT_OPTS="--bind='ctrl-o:execute-silent(code {})+abort'"

# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
FZF_CTRL_T_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
    file --mime {} | grep -q \"text\/.*;\" && bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa -l --color always {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# proxy
proxyon () {
    export http_proxy=Socks5://127.0.0.1:7891
    export https_proxy=Socks5://127.0.0.1:7891
    echo "http/https proxy on."
    curl ip.gs
}

proxyoff () {
    unset http_proxy
    unset https_proxy
    echo "http/https proxy off."
    curl ip.gs
}


# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true


source ~/.zshrc_ext
