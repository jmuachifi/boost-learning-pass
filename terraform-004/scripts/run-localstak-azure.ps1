docker rm -f localstack-azure-alpha

docker run -d --name localstack-azure-alpha `
	-p 4567:4566 `
	-v /var/run/docker.sock:/var/run/docker.sock `
	-e LOCALSTACK_AUTH_TOKEN=$env:LOCALSTACK_AUTH_TOKEN `
	localstack/localstack-azure-alpha
