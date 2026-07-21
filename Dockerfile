FROM n8nio/n8n:latest

USER root

# Update system package manager and install Python 3
RUN apt-get update && apt-get install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*

USER node
