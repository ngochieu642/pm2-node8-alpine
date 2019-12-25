FROM arm32v7/node:8.17.0-alpine3.11

# Copy qemu execution file
COPY qemu-arm-static /usr/bin

# Install pm2
RUN npm install pm2 -g

# Expose ports needed to use Keymetrics.io
EXPOSE 80 443 43554

# Start pm2.json process file
CMD ["pm2-runtime", "start", "pm2.json"]