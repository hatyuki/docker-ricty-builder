# Pull base image
FROM debian:latest

# Install packages
RUN apt-get update && apt-get install --yes --no-install-recommends \
        ca-certificates \
        fontforge \
        git-core \
        unzip \
        wget && \
    find /var/cache -type f -exec rm -f {} \; &&   \
    find /var/lib/apt -type f -exec rm -f {} \; && \
    find /var/log -type f | while read f; do :> $f; done;

# Create working directory
RUN mkdir -p /ricty/bin

# Copy build script
COPY files/ricty-build.sh /ricty/bin/ricty-build

# Set environment variables
ENV PATH /ricty/bin:$PATH

# Define mountable directories
VOLUME ["/ricty/fonts"]

# Define working directory
WORKDIR /ricty

# Define default entry point
ENTRYPOINT ["ricty-build"]

# Define default command
CMD ["/bin/bash"]
