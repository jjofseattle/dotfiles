#/bin/bash
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

color_prompt=yes
source ~/.git-completion.bash
source ~/.git-prompt.sh

# Pretty prompt
smiley() {
  if [ $? = 0 ]; then
    printf $1
  else
    printf $2
  fi
  return $?
}

export PS1='\nlinux$(smiley "\[\033[01;32m\]:)\[\033[00m\]" "\[\033[01;31m\]:(\[\033[00m\]")\[\033[0;35m\]$PWD \[\033[0;33m\]$(__git_ps1 " (%s)")($(node --version))\n ==>\[\e[0m\] '

# Cli Colors
export CLICOLOR=1
# use yellow for dir’s
export LSCOLORS=dxfxcxdxbxegedabagacad


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..="cd .."
alias ...="cd ../.."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias rm='rm -i'



export ANSIBLE_HOST_KEY_CHECKING=False
export PATH=$PATH:/home/jzeng/tools:/home/jzeng/.nvm:/home/jzeng/.local/bin
alias vi=vim

alias last20='history | tail -20'
alias gh='history | grep '
alias gp='ps aux | grep '
alias ggrep='git grep -n '

function title {
    echo -ne "\033]0;"$*"\007"
}

export DISPLAY=:0
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
