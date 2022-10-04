FROM zabbix/zabbix-proxy-sqlite3:ubuntu-latest

ENV ZBX_PROXYMODE=0
ENV ZBX_HOSTNAME=zabbix-proxy-sqlite3
ENV ZBX_SERVER_HOST=zabbix-server
ENV ZBX_SERVER_PORT=10051
ENV ZBX_DEBUGLEVEL=3
ENV ZBX_TIMEOUT=4
ENV ZBX_JAVAGATEWAY_ENABLE=false
ENV ZBX_VAULTDBPATH=
ENV ZBX_VAULTURL=https://127.0.0.1:8200
ENV VAULT_TOKEN=
ENV ZBX_ENABLEREMOTECOMMANDS=0
ENV ZBX_LOGREMOTECOMMANDS=0
ENV ZBX_SOURCEIP=
ENV ZBX_HOSTNAMEITEM=system.hostname
ENV ZBX_PROXYLOCALBUFFER=0
ENV ZBX_PROXYOFFLINEBUFFER=1
ENV ZBX_PROXYHEARTBEATFREQUENCY=60
ENV ZBX_CONFIGFREQUENCY=3600
ENV ZBX_DATASENDERFREQUENCY=1
ENV ZBX_STARTPOLLERS=5
ENV ZBX_STARTPREPROCESSORS=3
ENV ZBX_IPMIPOLLERS=0
ENV ZBX_STARTPOLLERSUNREACHABLE=1
ENV ZBX_STARTTRAPPERS=5
ENV ZBX_STARTPINGERS=1
ENV ZBX_STARTDISCOVERERS=1
ENV ZBX_STARTHISTORYPOLLERS=1
ENV ZBX_STARTHTTPPOLLERS=1
ENV ZBX_STARTODBCPOLLERS=1
ENV ZBX_JAVAGATEWAY=zabbix-java-gateway
ENV ZBX_JAVAGATEWAYPORT=10052
ENV ZBX_STARTJAVAPOLLERS=0
ENV ZBX_STATSALLOWEDIP=
ENV ZBX_STARTVMWARECOLLECTORS=0
ENV ZBX_VMWAREFREQUENCY=60
ENV ZBX_VMWAREPERFFREQUENCY=60
ENV ZBX_VMWARECACHESIZE=8M
ENV ZBX_VMWARETIMEOUT=10
ENV ZBX_ENABLE_SNMP_TRAPS=false
ENV ZBX_LISTENIP=
ENV ZBX_LISTENPORT=10051
ENV ZBX_LISTENBACKLOG=
ENV ZBX_HOUSEKEEPINGFREQUENCY=1
ENV ZBX_CACHESIZE=8M
ENV ZBX_STARTDBSYNCERS=4
ENV ZBX_HISTORYCACHESIZE=16M
ENV ZBX_HISTORYINDEXCACHESIZE=4M
ENV ZBX_TRAPPERTIMEOUT=300
ENV ZBX_UNREACHABLEPERIOD=45
ENV ZBX_UNAVAILABLEDELAY=60
ENV ZBX_UNREACHABLEDELAY=15
ENV ZBX_LOGSLOWQUERIES=3000
ENV ZBX_TLSCONNECT=unencrypted
ENV ZBX_TLSACCEPT=unencrypted
ENV ZBX_TLSCAFILE=
ENV ZBX_TLSCRLFILE=
ENV ZBX_TLSSERVERCERTISSUER=
ENV ZBX_TLSSERVERCERTSUBJECT=
ENV ZBX_TLSCERTFILE=
ENV ZBX_TLSKEYFILE=
ENV ZBX_TLSPSKIDENTITY=
ENV ZBX_TLSPSKFILE=
ENV ZBX_TLSCIPHERALL=
ENV ZBX_TLSCIPHERALL13=
ENV ZBX_TLSCIPHERCERT=
ENV ZBX_TLSCIPHERCERT13=
ENV ZBX_TLSCIPHERPSK=
ENV ZBX_TLSCIPHERPSK13=

USER root
SHELL ["/bin/bash", "-c"]
RUN apt update && \
    apt install apt-utils gpg curl -yq && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt update && \
    ACCEPT_EULA=Y apt-get install msodbcsql17 && \
    ACCEPT_EULA=Y apt-get install mssql-tools && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc && \
    source ~/.bashrc



