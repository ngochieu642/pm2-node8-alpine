# Build the image
docker buildx build -t ngochieu642/pm2-node8-alpine --platform=linux/arm/v7,linux/arm/v6,linux/arm64,linux/amd64 . --push