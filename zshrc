export ZSH="$HOME/.oh-my-zsh"
export PATH=/usr/local/share/python:$PATH

ZSH_THEME="hunghg255"

plugins=(svn macos git git-extras zsh-z node nvm npm github history brew zsh-autosuggestions
zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nano ~/.zshrc"

alias gs="git status"
alias ga="git add ."
alias gl="git log"
alias gc="git commit -m"
alias gcs="git commit -S -m"
alias gp="git push"
alias gpl="git pull"

# Them branch - git add branch
alias gab="git checkout -b"
# xoa cac thay doi - git delete all
alias gda="git checkout ."
# vao branch - git move branch
alias gmb="git checkout"
# merge B vao A, - vao branch A - git merge
alias gm="git merge"
# xoa branch - git delete branch
alias gdb="git checkout -D"
# git graph
alias glg="git log --graph --pretty=format:'%C(bold red)%h%Creset
-%C(bold yellow)%d%Creset %s %C(bold green)(%cr) %C(bold
blue)<%an>%Creset %C(yellow)%ad%Creset' --abbrev-commit --date=short"

# reset ve trang thai san sang git add - git reset add
alias gra="git reset --mixed"
# reset ve trang thai san sang commit - git reset commit
alias grc="git reset --sort"
# xoa commit - git delete commit
alias gdc="git reset --hard"
# commit nhanh
alias gg="gaa && gc 'update'"

# ai commit nhieu nhat
alias gmax="git shortlog -sn --no-merges"

# open vs code
alias vsc="code ."

export NVM_DIR="/Users/kengzone/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# bun completions
[ -s "/Users/kengzone/.bun/_bun" ] && source "/Users/kengzone/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export ANDROID_HOME=/Users/kengzone/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH


