# Dotfiles

Personal macOS dotfiles and configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).
Every file mirrors its target location relative to `$HOME`. Running `stow .` from the repo root creates symlinks in `~`.

## Bootstrap

Run `install.sh` to set up a new machine in one step:

```bash
./install.sh
```

This will:
1. Install Homebrew (if missing)
2. Install all packages from `Brewfile`
3. Install pipx packages from `pipx-packages.txt`
4. Create all symlinks via `stow .`

## Manual steps

```bash
# Apply dotfiles (create/update symlinks)
stow .

# Install all Homebrew packages
brew bundle --file=Brewfile

# Dump current Homebrew state back to Brewfile
brew bundle dump --file=Brewfile

# Install pipx packages
cat pipx-packages.txt | xargs -I{} sh -c 'pipx install $(echo {} | cut -d" " -f1)'
```
