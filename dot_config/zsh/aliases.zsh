# nvim
alias vim="lvim"
# lazygit
alias lg="lazygit"
# ls
alias la="ls -lah --color=auto"
# source zsh
alias sz="source ~/.zshrc"
# npm
alias ns="npm start"
alias ngl="npm list -g"
# ni
alias ns="nr start"
alias np="nr pstart"
alias nc="nr compile"
alias nb="nr build"
alias nd="nr dev"
alias nt="nr test"
# yarn
alias y="yarn"
alias ya="yarn add"
alias yad="yarn add -D"
alias yga="yarn global add"
alias yr="yarn remove"
alias ygl="yarn global list"
alias yo="yarn outdated"
# pnpm
alias pn="pnpm"
alias pa="pnpm add"
alias pad="pnpm add -D"
alias po="pnpm outdated --long"
alias pu="pnpm update --latest"
# git
alias gs="git status"
alias gc="git commit"
alias gcb="git checkout -b"
alias gp="git push"
alias gl="git pull"
alias gcl="git clone"
alias ga="git add"
alias gd="git diff"
alias gst="git status"
alias gfp="git fetch -p"
alias glog="git log --oneline --pretty --graph"
alias grm="git rebase main"
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
alias setproxy="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
alias unsetproxy="unset https_proxy http_proxy all_proxy"
