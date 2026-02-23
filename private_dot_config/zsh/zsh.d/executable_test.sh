#!env bash
grep -Po "([\+\@]\w+)" $BOOKMARKS_DIR/todo/todo.txt | sort | uniq
