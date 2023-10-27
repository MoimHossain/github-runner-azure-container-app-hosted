

```
docker build --build-arg RUNNER_VERSION=2.311.0 --tag moimhossain/ghrunner:v2.311.0 .

```

```
docker run --rm -e PAT='erd5xniz3g7ilqqkfssrxcdej5h3i6nwz6v5t6a7rdvblmdjxoga' -e GHUSER='moimhossain' -e REPO='github-runner-azure-container-app-hosted' moimhossain/ghrunner:v2.311.0
```