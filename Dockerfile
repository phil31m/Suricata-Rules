FROM codercom/code-server:latest

# Become root to install packages
USER root

# Install Suricata and Python
RUN apt-get update && \
    apt-get install -y suricata python3 python3-pip && \
    pip3 install suricata-language-server

# Switch back to coder user
USER coder

# Optional: preinstall some extensions (e.g., Python, JSON, YAML support)
RUN code-server --install-extension ms-python.python
RUN code-server --install-extension redhat.vscode-yaml

# Expose port
EXPOSE 8080

# Start code-server without auth (so anyone with link can access)
CMD ["code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8080", "/home/coder/project"]
