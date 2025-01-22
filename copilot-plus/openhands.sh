docker pull docker.all-hands.dev/all-hands-ai/runtime:0.19-nikolaik

export WORKSPACE_BASE=$(pwd)/openhands
docker run -it --rm --pull=always \
    -e SANDBOX_RUNTIME_CONTAINER_IMAGE=docker.all-hands.dev/all-hands-ai/runtime:0.19-nikolaik \
    -e LOG_ALL_EVENTS=true \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ~/.openhands-state:/.openhands-state \
    -v $WORKSPACE_BASE:/opt/workspace_base \
    -p 3000:3000 \
    --add-host host.docker.internal:host-gateway \
    --name openhands-app \
    docker.all-hands.dev/all-hands-ai/openhands:0.19