FROM n8nio/n8n:latest

USER root

# Install Python 3 into the container
RUN apk add --no-cache python3 py3-pip

USER node
