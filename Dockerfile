# Use debian as base
FROM debian:bookworm

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl suricata python3 python3-pip && \
    pip3 install --break-system-packages suricata-language-server

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Create workspace
RUN mkdir -p /workspace
WORKDIR /workspace

# Expose the port
EXPOSE 8080

# Start code-server when container runs
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none", "/workspace"]
