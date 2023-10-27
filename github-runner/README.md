

```
docker build --build-arg RUNNER_VERSION=2.311.0 --tag moimhossain/ghrunner:v2.311.0 .

```

```
docker run --rm -e PAT='' -e GHUSER='moimhossain' -e REPO='github-runner-azure-container-app-hosted' moimhossain/ghrunner:v2.311.0
```