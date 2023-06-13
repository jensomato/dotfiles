b() {
	[[ ! -d $BOOKMARKS_DIR ]] && echo "BOOKMARKS_DIR not set" && return 1
	result=$(find $BOOKMARKS_DIR/ -type l -printf "%P -> %l\\0" | fzf --read0)
	if [ "$?" -eq 0 ]; then
		cd "${result/* -> /}"
	fi
}
