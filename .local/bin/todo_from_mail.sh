#!/usr/bin/env bash
shopt -s nocasematch

pattern="=\?utf-8\?[BbQq]\?[^\?]+\?="

while IFS= read -r line; do
  if [[ $line =~ ^Subject:\ (.*) ]]; then
    subject="${BASH_REMATCH[1]}"
  elif [[ $line =~ ^Message-[iI][dD]:\ \<(.*)\> ]]; then
    message_id="${BASH_REMATCH[1]}"
  fi
done

if [[ "$subject" =~ $pattern ]]; then
    # Extrahieren des Kodierungstyps und des kodierten Textteils
    encoding_type=$(echo "$subject" | grep -oP "(?<=\?utf-8\?)[BbQq]" | head -1)
    encoded_text=$(echo "$subject" | grep -oP "(?<=\?utf-8\?[BbQq]\?)[^\?]+(?=\?=)" | head -1)
    # Entscheidung basierend auf dem Kodierungstyp
    if [[ "$encoding_type" =~ [Bb] ]]; then
        # Base64
        subject=$(python3 -c "import base64, sys; print(base64.b64decode(sys.argv[1]).decode('utf-8'))" "$encoded_text")
    elif [[ "$encoding_type" =~ [Qq] ]]; then
        # Quoted-Printable
        subject=$(python3 -c "import quopri, sys; print(quopri.decodestring(sys.argv[1].encode('utf-8')).decode('utf-8'))" "$encoded_text")
    fi
fi

todo=$(rofi -dmenu -p "Add Todo: " -filter "$subject")
if [[ $todo != "" ]]; then
	todo-txt add "$todo @mail url:$message_id"
fi
