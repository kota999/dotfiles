export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/usr/local/bin

# Test of global alias
function ls-peco(){
    FILTERD_LS=$(ls | peco)
    echo $FILTERD_LS
}

alias -g L='$(ls-peco)'
