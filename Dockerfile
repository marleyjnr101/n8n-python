FROM n8nio/n8n:latest

USER root

# 1. Restore apk from Alpine base image
COPY --from=alpine:latest /sbin/apk /sbin/apk
COPY --from=alpine:latest /lib/apk /lib/apk
COPY --from=alpine:latest /etc/apk /etc/apk
COPY --from=alpine:latest /usr/share/apk /usr/share/apk

# 2. Install Python 3, pip, and virtualenv tools
RUN apk add --no-cache python3 py3-pip py3-virtualenv

# 3. Pre-create the Python virtual environment n8n expects
RUN mkdir -p /home/node/.n8n/runner-scripts /home/node/.n8n/nodes/python-runner && \
    python3 -m venv /home/node/.n8n/nodes/python-runner/.venv && \
    /home/node/.n8n/nodes/python-runner/.venv/bin/pip install --upgrade pip setuptools wheel && \
    chown -R node:node /home/node/.n8n

USER node
