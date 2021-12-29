export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/usr/local/bin
export PATH=$PATH:~/.cargo/bin

# Test of global alias
function ls-peco(){
    FILTERD_LS=$(ls | peco)
    echo $FILTERD_LS
}

alias -g Ls='$(ls-peco)'
alias -g L=Ls

function ghq-peco(){
    FILTERD_GHQ=$(ghq list -p | peco)
    echo $FILTERD_GHQ
}
alias -g ghq-l='$(ghq-peco)'

