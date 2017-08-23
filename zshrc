# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac


## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete


## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

## terminal configuration
#
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-256color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
xterm|xterm-256color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

### git用 zshプロンプト設定
# カラーの設定を$fg[red]のように人がわかるような書き方ができる
autoload -Uz colors
colors

#
# Color定義(あとで変更しやすいように)
#
DEFAULT=$'%{\e[0;0m%}'
RESET="%{${reset_color}%}"
GREEN="%{${fg[green]}%}"
BOLD_GREEN="%{${fg_bold[green]}%}"
BLUE="%{${fg[blue]}%}"
BOLD_BLUE="%{${fg_bold[blue]}%}"
RED="%{${fg[red]}%}"
BOLD_RED="%{${fg_bold[red]}%}"
CYAN="%{${fg[cyan]}%}"
BOLD_CYAN="%{${fg_bold[cyan]}%}"
YELLOW="%{${fg[yellow]}%}"
BOLD_YELLOW="%{${fg_bold[yellow]}%}"
MAGENTA="%{${fg[magenta]}%}"
BOLD_MAGENTA="%{${fg_bold[magenta]}%}"
WHITE="%{${fg[white]}%}"


setopt prompt_subst
autoload -Uz add-zsh-hook


#
# Gitの状態表示
#
# 記号について
#   - : WorkingTreeに変更がある場合(Indexにaddしていない変更がある場合)
#   + : Indexに変更がある場合(commitしていない変更がIndexにある場合)
#   ? : Untrackedなファイルがある場合
#   * : remoteにpushしていない場合
#
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
    # zshが4.3.10以上の場合
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"
    zstyle ':vcs_info:git:*' unstagedstr "-"
    zstyle ':vcs_info:git:*' formats '%s,%u%c,%b'
    zstyle ':vcs_info:git:*' actionformats '%s,%u%c,%b|%a'
fi

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    local _vcs_name _status  _branch_action
    if [ -n "$vcs_info_msg_0_" ]; then
        _vcs_name=$(echo "$vcs_info_msg_0_" | cut -d , -f 1)
        _status=$(_git_untracked_or_not_pushed $(echo "$vcs_info_msg_0_" | cut -d , -f 2))
        _branch_action=$(echo "$vcs_info_msg_0_" | cut -d , -f 3)
        psvar[1]="(${_vcs_name})-[${_status}${_branch_action}]"
    fi
    # 右側プロンプト
    RPROMPT="${RESET}%1(v|${RED}%1v|)${RESET}${BOLD_YELLOW}${VIRTUAL_ENV:+($(basename "$VIRTUAL_ENV"))}${RESET}${RESET}"
    #RPROMPT="${RESET}%1(v|${RED}%1v|)${RESET}${BOLD_YELLOW}${VIRTUAL_ENV:+($(basename "$VIRTUAL_ENV"))}${RESET}${MAGENTA}%D{%Y/%m/%d %H:%M:%S}${RESET}]${RESET}"
}
add-zsh-hook precmd _update_vcs_info_msg

#
# Untrackedなファイルが存在するか未PUSHなら記号を出力
#   Untracked: ?
#   未PUSH: *
#
function _git_untracked_or_not_pushed() {
    local git_status head remotes stagedstr
    local  staged_unstaged=$1 not_pushed="*" untracked="?"
    # カレントがgitレポジトリ下かどうか判定
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = "true" ]; then
        # statusをシンプル表示で取得
        git_status=$(git status -s 2> /dev/null)
        # git status -s の先頭が??で始まる行がない場合、Untrackedなファイルは存在しない
        if ! echo "$git_status" | grep "^??" > /dev/null 2>&1; then
            untracked=""
        fi

        # stagedstrを取得
        zstyle -s ":vcs_info:git:*" stagedstr stagedstr
        # git status -s の先頭がAで始まる行があればstagedと判断
        if [ -n "$stagedstr" ] && ! printf "$staged_unstaged" | grep "$stagedstr" > /dev/null 2>&1 \
            && echo "$git_status" | grep "^A" > /dev/null 2>&1; then
            staged_unstaged=${staged_unstaged}${stagedstr}
        fi

        # HEADのハッシュ値を取得
        #  --verify 有効なオブジェクト名として使用できるかを検証
        #  --quiet  --verifyと共に使用し、無効なオブジェクトが指定された場合でもエラーメッセージを出さない
        #           そのかわり終了ステータスを0以外にする
        head=$(git rev-parse --verify -q HEAD 2> /dev/null)
        if [ $? -eq 0 ]; then
            # HEADのハッシュ値取得に成功
            # リモートのハッシュ値を配列で取得
            remotes=($(git rev-parse --remotes 2> /dev/null))
            if [ "$remotes[*]" ]; then
                # リモートのハッシュ値取得に成功(リモートが存在する)
                for x in ${remotes[@]}; do
                    # リモートとHEADのハッシュ値が一致するか判定
                    if [ "$head" = "$x" ]; then
                        # 一致した場合はPUSH済み
                        not_pushed=""
                        break
                    fi
                done
            else
                # リモートが存在しない場合
                not_pushed=""
            fi
        else
            # HEADが存在しない場合(init直後など)
            not_pushed=""
        fi

        # Untrackedなファイルが存在するか未PUSHなら記号を出力
        if [ -n "$staged_unstaged" -o -n "$untracked" -o -n "$not_pushed" ]; then
            printf "${staged_unstaged}${untracked}${not_pushed}"
        fi
    fi
    return 0
}

## load user .zshrc configuration file
#
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine
[ -f ${HOME}/.zshenv ] && source ${HOME}/.zshenv

