FROM n8nio/n8n:latest

USER root

# 1. Restore the apk package manager from the official Alpine image
COPY --from=alpine:latest /sbin/apk /sbin/apk
COPY --from=alpine:latest /lib/apk /lib/apk
COPY --from=alpine:latest /etc/apk /etc/apk
COPY --from=alpine:latest /usr/share/apk /usr/share/apk

# 2. Update repositories and install Python 3
RUN apk add --no-cache python3 py3-pip

USER node
