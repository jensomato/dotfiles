#!/bin/bash
NOTES_DIR="$HOME/projects/notes"
INDEX_JSON="$NOTES_DIR/.app/dist/index.json"
find $NOTES_DIR -path ./.app -prune -o -name "*.md" -print
