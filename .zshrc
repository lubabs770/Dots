	#
	#
	#         _
	#  _______| |__  _ __ ___
	# |_  / __| '_ \| '__/ __|
	#  / /\__ \ | | | | | (__
	# /___|___/_| |_|_|  \___|
	#
	#
	#
	#


	# dedupe
	typeset -U PATH
	
	# exports / env vars
	export PATH="/opt/homebrew/bin:$PATH"
	# Add the LSP binary to PATH
	export EDITOR="nvim"
	export PATH="$PATH:$HOME/.local/bin"
	export FZF_DEFAULT_OPTS="
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
  --layout=reverse
  --border=rounded
  --border-label=' fzf '
  --padding=1
  --margin=1
  --info=inline
  --prompt='❯ '
  --pointer='▶'
  --marker='✓'
  --preview-window='right:55%:rounded'
"


	
	#imports
	source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source ~/.zsh/plugins/shell_functions.sh

	# theme
	 source ~/.zsh/themes/aphrodite/aphrodite.zsh-theme
	 # source ~/.zsh/themes/robbyrussell/robbyrussell.sh
	
	
	# needed for node
	export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    	
	#case insensitive "cd'ing"	
	zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

	#aliases
	alias c="clear"
	alias e='$EDITOR ~/.zshrc'
	alias s="source ~/.zshrc"
  alias h="z ~/"
	alias -g clip='| pbcopy'
	alias cd="z"
  alias ls='ls -a'
  alias vi='$EDITOR'
  alias dev="cd ~/code/<redacted>/web-app"
  alias grep='rg'
  alias fff='fzf'

	  # App aliases
  alias finder='open -a finder .'
  alias chrome='open -a "Google Chrome"'
  alias firefox='open -a firefox'
  alias numbers='open -a numbers'
  alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
  alias bluesend='open -a "Bluetooth File Exchange"'
  alias play='open -a "quicktime player"'
  



	
		


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


eval "$(zoxide init zsh)"


# Rust / Cargo
source "$HOME/.cargo/env"



# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/<redacted>/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
