# ------------------------------------------------------------------------------
# Based on a work at https://github.com/docker/docker.
# ------------------------------------------------------------------------------
# Pull base image.
FROM ubuntu:latest
MAINTAINER Johannes Jaeger <kontakt@johannesjaeger.com>
MAINTAINER Michel Albers <technik@interwebs-ug.de>

# ------------------------------------------------------------------------------
# Install base
RUN apt-get update
RUN apt-get install -y build-essential g++ curl libssl-dev apache2-utils git libxml2-dev tmux python-setuptools zsh wget git-core vim
RUN chsh -s /usr/bin/zsh root

# ------------------------------------------------------------------------------
# Install NPM 
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs
RUN curl -L https://npmjs.com/install.sh | sh

# ------------------------------------------------------------------------------
# Install NVM
RUN git clone https://github.com/creationix/nvm.git /.nvm
RUN echo ". /.nvm/nvm.sh" >> /etc/bash.bashrc
RUN /bin/bash -c '. /.nvm/nvm.sh && \
    nvm install v0.12.6 && \
    nvm use v0.12.6 && \
    nvm alias default v0.12.6'

# ------------------------------------------------------------------------------
# Install Cloud9SDK
RUN git clone https://github.com/c9/core/ /c9sdk
WORKDIR /c9sdk
RUN scripts/install-sdk.sh
RUN sed -i -e "s/127.0.0.1/0.0.0.0/g" /c9sdk/configs/standalone.js

# ------------------------------------------------------------------------------
# Install Meteor, PhantomJS and forever
RUN curl https://install.meteor.com/ | sh
RUN npm install -g phantomjs forever

# ------------------------------------------------------------------------------
# Add volumes
RUN mkdir /workspace
VOLUME /workspace

# ------------------------------------------------------------------------------
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ------------------------------------------------------------------------------
# Expose ports.
EXPOSE 8181

# ------------------------------------------------------------------------------
# Start supervisor, define default command.
CMD ["sh", "-c", "forever /c9sdk/server.js --auth ${C9_USER}:${C9_PASSWORD} --listen 0.0.0.0 --collab -w /workspace"]
