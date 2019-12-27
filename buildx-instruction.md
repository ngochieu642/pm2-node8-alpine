# BUILD NATIVE IMAGE FOR ARM ARCHITECT

## METHODS

### Method 1

- Compile the program directly on the hardware itself.

### Method 2

- Use an emulator: QEMU
- Emulate just the target's user-space via binfmt_misc

### Method 3

- Standard method used in the embedded systems community: cross-compilation
- As efficient as building from the target hardware itself

## NOTES

- **This file only focuses on Method 2 using buildx**
- In case you want to switch to using `qemu`, reboot and then you can do the qemu build easily by following the instructions.

## Building multi-arch Docker images

### Step 1: Enable buildx

- Needs to enable `buildx` by setting the environment variable

```bash
export DOCKER_CLI_EXPERIMENTAL=enabled
```

### Step 2 — Enable binfmt_misc to run non-native Docker images

- If you're using Docker Desktop (Mac and Windows), you can skip this step because binfmt_misc is set up by default.
- If you're on Linux, you need to set up binfmt_misc. This is pretty easy in most distributions, but is even easier now that you can just run a privileged Docker container to set it up for you:
- Run the latest tag of this image: https://hub.docker.com/r/docker/binfmt/tags

```bash
docker run --rm --privileged docker/binfmt:66f9012c56a8316f9244ffd7622d7c21c1f6f28d
```

### Step 3 — Switch from the default Docker builder to a multi-arch builder

- By default, Docker will use the old builder instance without multi-arch support.
- To create a new builder with multi-arch support, run:

```bash
docker buildx create --use --name mybuilder
```

### Step 4 — Build a multi-arch image

- Dockerfile

```Dockerfile
FROM node:8.17.0-alpine3.11

# Install pm2
RUN npm install pm2 -g

# Expose ports needed to use Keymetrics.io
EXPOSE 80 443 43554

# Start pm2.json process file
CMD ["pm2-runtime", "start", "pm2.json"]
```

- Build the image using `buildx`

```bash
docker buildx build -t ngochieu642/hello-arch --platform=linux/arm/v7,linux/arm/v6,linux/arm64,linux/amd64 . --push
```

### Step 5 — Test the multi-arch image

```bash
docker run --rm docker.io/ngochieu642/test-pm2:latest
```
