function vim_mode_prompt () {
        REPLY=${MODE_INDICATOR_PROMPT}
    }
source "$ZDOTDIR/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh"
#
# Prompt
#
MODE_CURSOR_VICMD="#ebcb8b block"
MODE_CURSOR_VIINS="#d8dee9 blinking bar"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_INDICATOR_VIINS='%# '
MODE_INDICATOR_VICMD='%B%F{#ebcb8b}%#%f%b '

# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}●%f" # default 'S'
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f" # default 'U'
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats '[%b%m%c%u] ' # default ' (%s)-[%b]%c%u-'
zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'

function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%F{blue}●%f"
  fi
}

grml_theme_add_token vim -f vim_mode_prompt
zstyle ':prompt:grml:left:setup' items rc change-root user at host path vcs vim
