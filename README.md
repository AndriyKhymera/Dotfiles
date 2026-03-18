# Dotfiles

Personal macOS dotfiles and configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).
Every file mirrors its target location relative to `$HOME`. Running `stow .` from the repo root creates symlinks in `~`.

## Setup

```bash
# Apply dotfiles (create symlinks)
stow .

# Install all Homebrew packages
brew bundle --file=Brewfile

# Dump current Homebrew state back to Brewfile
brew bundle dump --file=Brewfile

# Install pipx packages
cat pipx-packages.txt | xargs -I{} sh -c 'pipx install $(echo {} | cut -d" " -f1)'
```
