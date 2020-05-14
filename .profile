export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export VIFM="$XDG_CONFIG_HOME/vifm"

# zsh config
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Default programs:
export EDITOR="vim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"

# fzf config
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs --color never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="rg --files --hidden --null 2> /dev/null | xargs -0 dirname | awk '!h[\$0]++'"

# mc config
export MC_XDG_OPEN="$HOME/bin/nohup-open"

# ripgrep config
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# nnn configuration
export NNN_TMPFILE="/tmp/nnn"
export NNN_COPIER="$HOME/scripts/nnn-copier.sh"

# less configuration
export LESS="-iRw"

# man configuration
export MANPAGER='/bin/sh -c "col -b | vim --noplugin -c '\''set ft=man ts=8 nomod nolist nonu noma'\'' -"'

export JAVA_HOME="/usr/lib/jvm/default-java"
export MVN_HOME="/opt/maven"
export MAVEN_HOME="/opt/maven"
export ANDROID_HOME="/opt/Android/Sdk"
export PATH="$HOME/bin:$MVN_HOME/bin:$ANDROID_HOME/platform-tools:$PATH"
export MC_PROFILE_ROOT="$HOME"
# TERM variable for truecolor support in tmux - https://github.com/icymind/NeoSolarized
export TERM="xterm-256color"
