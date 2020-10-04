FROM rustlang/rust:nightly

# Verify Cargo location.
RUN echo 'Verifying Cargo location...' && \
    [ -d '/usr/local/cargo' ]

# Install sccache.
RUN echo 'Installing sccache...' && \
    mkdir -p /opt/sccache/ && \
    cd /opt/sccache/ && \
    wget 'https://github.com/mozilla/sccache/releases/download/0.2.13/sccache-0.2.13-x86_64-unknown-linux-musl.tar.gz' && \
    wget 'https://github.com/mozilla/sccache/releases/download/0.2.13/sccache-0.2.13-x86_64-unknown-linux-musl.tar.gz.sha256' && \
    echo 'Verifying checksum...' && \
    echo "$(cat sccache-0.2.13-x86_64-unknown-linux-musl.tar.gz.sha256) sccache-0.2.13-x86_64-unknown-linux-musl.tar.gz" | sha256sum --check && \
    echo 'Extracting prebuilt binary...' && \
    tar -xvzf sccache-0.2.13-x86_64-unknown-linux-musl.tar.gz --strip-components 1 && \
    rm sccache-0.2.13-x86_64-unknown-linux-musl.tar.gz && \
    rm sccache-0.2.13-x86_64-unknown-linux-musl.tar.gz.sha256 && \
    ln -s /opt/sccache/sccache /usr/local/bin/sccache && \
    echo 'Verifying installation...' && \
    sccache --version

# Update registry index.
ARG CACHE_KEY
RUN echo 'Updating registry index...' && \
    echo "CACHE_KEY=$CACHE_KEY" && \
    cargo search --verbose --limit 0
