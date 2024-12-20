## fzf config
if [ -r /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
	source /usr/share/doc/fzf/examples/key-bindings.zsh
fi
if [ -r /usr/share/doc/fzf/examples/completion.zsh ]; then
	source /usr/share/doc/fzf/examples/completion.zsh
fi
if [ -r /usr/share/zsh/vendor-completions/_fzf ]; then
	source /usr/share/zsh/vendor-completions/_fzf
fi

# Base16 Nord
# Author: arcticicestudio

_gen_fzf_default_opts() {

local color00='#2E3440'
local color01='#3B4252'
local color02='#434C5E'
local color03='#4C566A'
local color04='#D8DEE9'
local color05='#E5E9F0'
local color06='#ECEFF4'
local color07='#8FBCBB'
local color08='#88C0D0'
local color09='#81A1C1'
local color0A='#5E81AC'
local color0B='#BF616A'
local color0C='#D08770'
local color0D='#EBCB8B'
local color0E='#A3BE8C'
local color0F='#B48EAD'

export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts
