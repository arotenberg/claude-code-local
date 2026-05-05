#!/bin/bash -ex

docker build -t claude-code-ollama -f Dockerfile-claude-code-ollama .
touch .claude.json
docker run -it --rm  \
	--network="host"  \
	-v "./.claude.json:/root/.claude.json"  \
	-v "./.claude:/root/.claude"  \
	claude-code-ollama  \
	-- "$@"
