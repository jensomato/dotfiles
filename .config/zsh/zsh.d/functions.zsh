b() {
	[[ ! -d $BOOKMARKS_DIR ]] && echo "BOOKMARKS_DIR not set" && return 1
	result=$(find $BOOKMARKS_DIR/ -type l -printf "%P -> " -exec realpath -z {} \; | fzf --read0)
	if [ "$?" -eq 0 ]; then
		cd "${result/* -> /}"
	fi
}
trim() { awk '{$1=$1};1' }
ltrim() { awk '{ sub(/^[ \t]+/, ""); print }' }
rtrim() { awk '{ sub(/[ \t]+$/, ""); print }' }
