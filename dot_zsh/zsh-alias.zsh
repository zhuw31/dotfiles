# nvim
alias v="nvim"
# lazygit
alias lg="lazygit"
# ls
alias la="ls -lah --color=auto"
# source zsh
alias sz="source ~/.zshrc"
# npm
alias ns="npm start"
alias ngl="npm list -g"
# yarn
alias y="yarn"
alias ys="yarn start"
alias yp="yarn pstart"
alias yc="yarn compile"
alias ya="yarn add"
alias yad="yarn add -D"
alias yga="yarn global add"
alias yr="yarn remove"
alias ygl="yarn global list"
alias yo="yarn outdated"
# pnpm
alias pn="pnpm"
# git
alias gs="git status"
function gc { git commit -m "$@"; }
alias gcb="git checkout -b"
alias gp="git push"
alias gl="git pull"
alias gcl="git clone"
alias ga="git add ."
alias gd="git diff"
alias gst="git status"
alias gfp="git fetch -p"
alias glog="git log --oneline --pretty --graph"
# chrome debug
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
# chezmoi
alias c="chezmoi"
alias cu="chezmoi update"
# kubetcl
alias k="kubectl"
alias kgp="kubectl get pods"
alias kcu="kubectl config use-context"
alias kcn="kubectl config set-context --current --namespace"
# proxy
alias setproxy="export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;"
alias unsetproxy="unset https_proxy http_proxy all_proxy"
