# Misc
export LANG="en_US.UTF-8"
export EDITOR="lvim"
export HOMEBREW_BUNDLE_FILE="~/.Brewfile"
export TEALDEER_CONFIG_DIR="~/.config/tealdeer"

# bun completions
[ -s "/Users/zhuwei/.bun/_bun" ] && source "/Users/zhuwei/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOPROXY="https://goproxy.cn,direct"
export PATH=$PATH:$GOBIN
export PATH=$PATH:/usr/local/go/bin
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
