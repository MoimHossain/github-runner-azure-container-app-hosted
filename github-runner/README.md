

```
docker build --build-arg RUNNER_VERSION=2.298.2 --tag moimhossain/ghrunner:beta .
```

```
docker run --rm -e PAT='' -e GHUSER='moimhossain' -e REPO='github-runner-azure-container-app-hosted' moimhossain/ghrunner:beta
```