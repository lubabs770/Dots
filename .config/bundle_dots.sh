cd ~/

mkdir "tmpDoodle"



# Stage the standard dotfiles
cp -r \
  ~/.config \
  ~/.iterm2 \
  ~/.zsh \
  ~/.claude.json \
  ~/.hushlogin \
  ~/.iterm2_shell_integration.zsh \
  ~/.simplebarrc \
  ~/.yabairc \
  ~/.zshrc \
  ~/tmpDoodle

# Stage macOS VS Code user settings specifically (using quotes for the spaces)
mkdir -p ~/tmpDoodle/vscode
cp "$HOME/Library/Application Support/Code/User/settings.json" ~/tmpDoodle/vscode/ 2>/dev/null
cp "$HOME/Library/Application Support/Code/User/keybindings.json" ~/tmpDoodle/vscode/ 2>/dev/null

# Generate plain text lists for Homebrew and VS Code extensions
brew bundle dump --file="$HOME/tmpDoodle/Brewfile"
code --list-extensions > "$HOME/tmpDoodle/vscode/extensions.txt" 2>/dev/null


# Stage the main iTerm2 preferences file (where your actual profile settings live)
cp "$HOME/Library/Preferences/com.googlecode.iterm2.plist" ~/tmpDoodle/ 2>/dev/null



# Remove any old backups first so the new one isn't deleted
rm -f ~/.config/*_dots_backup.zip

# Zip the staging folder and output the archive directly into .config
zip -r "$HOME/.config/$(date +"%Y-%m-%dT%H-%M-%S%z")_dots_backup.zip" tmpDoodle

# Clean up the staging folder
rm -rf tmpDoodle
