#!/bin/bash

# Get the local IP address
_local_ip=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | head -n 1)

# Construct the new OLLAMA_HOST value
new_ollama_host="OLLAMA_HOST=http://$_local_ip:11434"

# Replace the OLLAMA_HOST line in the .env file
sed -i.bak "s|^OLLAMA_HOST=.*|$new_ollama_host|" .env

# Export the new OLLAMA_HOST value
export OLLAMA_HOST="http://$_local_ip:11434"

# Print the new OLLAMA_HOST value
echo $OLLAMA_HOST

# Start the OLLAMA service
ollama serve