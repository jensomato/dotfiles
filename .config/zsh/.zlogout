if [[ "$HOST" == "rycon" ]]; then
	# this is needed for agent forwarding
	gpgconf --kill gpg-agent
fi
