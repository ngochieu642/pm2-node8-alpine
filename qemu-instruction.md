# BUILD NATIVE IMAGE FOR ARM ARCHITECT

## NOTES

- **This file focuses on how to build docker-image for different architect using qemu.**
- In case you want to switch to `buildx` option, remove the `qemu-user-static` package first then reboot.

## Building ARM Docker images

### Step 1: Enable qemu

```bash
sudo apt-get install qemu-user-static
```

### Step 2: Copy the execution file

```bash
cp /usr/bin/qemu-arm-static /you/project/path
```

- Here the project path is the folder that contains Dockerfile

### Step 3: Build the image

- You need to copy the `qemu-arm-static` file inside the image

- Dockerfile

```Dockerfile
FROM arm32v7/node:8.17.0-alpine3.11

# Copy qemu execution file
COPY qemu-arm-static /usr/bin

# Install pm2
RUN npm install pm2 -g

# Expose ports needed to use Keymetrics.io
EXPOSE 80 443 43554

# Start pm2.json process file
CMD ["pm2-runtime", "start", "pm2.json"]
```

```bash
docker build -f qemu.Dockerfile -t ngochieu642/pm2-node8-alpine-qemu .
```

### Step 4: Test the Image

```bash
docker run --rm docker.io/ngochieu642/test-pm2:qemu
```
