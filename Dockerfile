FROM rust

# Update registry index.
RUN cargo search --verbose --limit 0
