# BUILD PM2 FOR DIFFERENT ARCHITECT

- Use `buildx` to build pm2 for multi architect

## How to run

- Remember to remove the `docker push` parts from .sh files.

## BUILDX

- 1/ Check this repository: https://hub.docker.com/r/docker/binfmt/tags and get the latest tag
- 2/ Fix the build.sh file: Replace tag of `docker/binfmt:tag` with the latest tag
- 3/ Enable qemu, set up binfmt_misc and build the image by running these files:

```bash
bash setup.sh
```

Check whether buildx is enabled yet.

```bash
docker buildx version
```

If not, you might need to run each command in setup.sh manually

```bash
bash build.sh
```

## QEMU LOCAL

- 1/ Copy qemu execution file & build the image by running

```bash
bash qemu.build.sh
```
