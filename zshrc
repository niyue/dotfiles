# zsh
export ZSH=~/.oh-my-zsh
plugins=(git docker brew scala sbt python zsh-syntax-highlighting zsh-autosuggestions cp kubectl)

# install pure prompt
ZSH_THEME=""
fpath+=$HOME/.zsh/pure

source $ZSH/oh-my-zsh.sh

# initiate pure
autoload -U promptinit; promptinit
prompt pure

# alias
alias ll="exa -hal"
alias ping="prettyping"
alias k=kubectl

alias ,='cd ..'
alias ,,='cd ../..'
alias ,,,='cd ../../..'
alias ,,,,='cd ../../../..'
alias ,,,,,='cd ../../../../..'
alias ,,,,,,='cd ../../../../../..'
alias ,,,,,,,='cd ../../../../../../..'
alias ,,,,,,,,='cd ../../../../../../../..'

# autojump
[ -f  /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# fzf configuration
FZF_DEFAULT_OPTS="--bind='ctrl-o:execute-silent(code {})+abort'"

# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
FZF_CTRL_T_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
    file --mime {} | grep -q \"text\|json\|csv\" && bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa -l --color always {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"

# find-in-file - usage: fif <SEARCH_TERM>
fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!";
    return 1;
  fi
  rg --files-with-matches --no-messages "$1" | fzf $FZF_PREVIEW_WINDOW --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

whereami () {
    curl -H 'Accept: application/json' -s ip.gs | jq '.ip + "@" + .city + ", " + .country'
}

# proxy
proxyon () {
    export http_proxy="socks5://127.0.0.1:7890"
    export https_proxy="socks5://127.0.0.1:7890"
    git config --global http.proxy $http_proxy
    git config --global https.proxy $https_proxy
    echo "http/https proxy on."
    whereami
}

proxyoff () {
    unset http_proxy
    unset https_proxy
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    echo "http/https proxy off."
    whereami
}


# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true


source ~/.zshrc_ext


export PATH="$HOME/.poetry/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/opt/homebrew/bin:$PATH"

alias brow='arch --x86_64 /usr/local/Homebrew/bin/brew'
