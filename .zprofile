eval "$(/opt/homebrew/bin/brew shellenv)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"
. "$HOME/.cargo/env"

# Created by `pipx` on 2025-03-06 10:36:40
export PATH="$PATH:/Users/andriikhymera/.local/bin"
