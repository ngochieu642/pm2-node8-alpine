# BUILD PM2 FOR DIFFERENT ARCHITECT

- Use `buildx` to build pm2 for multi architect

## How to run

- 1/ Check this repository: https://hub.docker.com/r/docker/binfmt/tags and get the latest tag
- 2/ Fix the build.sh file: Replace tag of `docker/binfmt:tag` with the latest tag
- 3/ Enable qemu, set up binfmt_misc and build the image

```bash
build.sh
```
