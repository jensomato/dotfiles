function zvm_config() {
  # Do the initialization when the script is sourced (i.e. Initialize instantly)
  # This file should be run first to make sure keybindings will not be overwritten
  ZVM_INIT_MODE=sourcing
  # Always starting with insert mode for each command line
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}

if [[ -r "${HOME}/.local/src/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]]; then
  source "${HOME}/.local/src/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
fi
