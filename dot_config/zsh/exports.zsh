# Misc
export LANG="en_US.UTF-8"
export EDITOR=lvim
export HOMEBREW_BUNDLE_FILE="~/.Brewfile"
export TEALDEER_CONFIG_DIR="~/.config/tealdeer"

# pnpm
export PNPM_HOME="/Users/zhuwei/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# bun completions
[ -s "/Users/zhuwei/.bun/_bun" ] && source "/Users/zhuwei/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:/usr/local/go/bin
