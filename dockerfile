FROM zabbix/zabbix-proxy-sqlite3:ubuntu-latest

USER root
SHELL ["/bin/bash", "-c"]
RUN apt update && \
    apt install sudo apt-utils gpg curl -yq && \
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc && \
    curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list && \
    apt update && \
    ACCEPT_EULA=Y apt-get install msodbcsql18 -yq && \
    ACCEPT_EULA=Y apt-get install mssql-tools18 -yq && \
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bash_profile && \
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc && \
    source ~/.bashrc
