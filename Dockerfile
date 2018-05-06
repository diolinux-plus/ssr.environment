FROM library/node:8.11-alpine
LABEL maintainer="Gerardo Junior <me@gerardo-junior.com>"

# Install app dependencies
RUN apk update && \
    apk upgrade && \
    apk add git

# Cleanup system
RUN rm -Rf /var/cache/apk/* /tmp/*

# Create app directory
RUN mkdir -p /usr/share/src

# Copy scripts
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set project directory
VOLUME ["/usr/share/src"]
WORKDIR /usr/share/src
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 3000