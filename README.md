# Dotfiles

This is my dotfiles powered by [chezmoi](https://www.chezmoi.io/docs/install/) for :apple: users.

## Install

Firstly, install `brew`:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Secondly, install `chezmoi`:

```sh
brew install chezmoi
```

Lastly, pull and apply my dotfiles:

```sh
chezmoi init --apply --verbose https://github.com/zhuw31/dotfiles.git
```

---

Happy coding!:rocket:
