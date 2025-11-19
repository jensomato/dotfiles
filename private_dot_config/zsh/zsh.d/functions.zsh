b() {
	[[ ! -d $BOOKMARKS_DIR ]] && echo "BOOKMARKS_DIR not set" && return 1
	result=$(find $BOOKMARKS_DIR/ -type l -printf "%P -> " -exec realpath -z {} \; | fzf -1 -q "$1" -e --read0 --preview='var="{}";var="${var%'\''}"; var="${var#'\''}"; var="${var/* -> /}"; ls -l --group-directories-first "$var"')
	if [ "$?" -eq 0 ]; then
		cd "${result/* -> /}"
	fi
}
trim() { awk '{$1=$1};1' }
ltrim() { awk '{ sub(/^[ \t]+/, ""); print }' }
rtrim() { awk '{ sub(/[ \t]+$/, ""); print }' }
cdb() {
	cd "$(fzf-bookmarks)"
}
cdgitroot() {
  # Find the root directory of the git repository
  local git_root=$(git rev-parse --show-toplevel 2>/dev/null)

  if [[ -n "$git_root" ]]; then
    # If git_root is not empty, change directory to git_root
    cd "$git_root" || return
  else
    # If the command failed (likely not in a git repo), print an error message to stderr in red color
    echo -e "\033[0;31mError: Not inside a git repository.\033[0m" >&2 && return 1
  fi
}
