_fzf_complete_git() {
    ARGS="$@"
    local branches
    branches=$(git branch -vv --all)
    if [[ $ARGS == 'git co'* ]]; then
        _fzf_complete --reverse --multi -- "$@" < <(
            echo $branches
        )
    else
        eval "zle ${fzf_default_completion:-expand-or-complete}"
    fi
}

_fzf_complete_git_post() {
    awk '{print $1}'
}

_fzf_complete_pass() {
  _fzf_complete +m -- "$@" < <(
    local prefix
    prefix="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
    command find -L "$prefix" \
      -name "*.gpg" -type f | \
      sed -e "s#${prefix}/\{0,1\}##" -e 's#\.gpg##' -e 's#\\#\\\\#' | sort
  )
}

_fzf_complete_todo-txt() {
    ARGS="$@"
    local params
    params=$(grep -Po "([\+\@]\w+)" $BOOKMARKS_DIR/todo/todo.txt | sort | uniq)
    if [[ $ARGS =~ '(todo-txt|t|todo.sh) add .*' ]]; then
        _fzf_complete --reverse --multi -- "$@" < <(
            echo $params
        )
    else
        eval "zle ${fzf_default_completion:-expand-or-complete}"
    fi
}

_fzf_complete_todo-txt_post() {
    awk '{print $1}'
}
