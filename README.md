## Docker image for Zabbix Proxy with SQL DB monitoring by ODBC

You can edit TAG of FROM according as your need, as long as it's Ubuntu based.

All Environment Variables in this dockerfile is the same ones listed in the Docker Hub of zabbix-proxy-sqlite3:
https://hub.docker.com/r/zabbix/zabbix-proxy-sqlite3

### How to use:

1. Clone and build:
``` 
git clone https://github.com/LuanArndt/zabbix-proxy-odbc.git
cd zabbix-proxy-odbc/
docker build -t luanarndt/zabbix-proxy-odbc .
``` 

2. Create odbc.ini according as Zabbix Documentation:
https://www.zabbix.com/documentation/current/en/manual/config/items/itemtypes/odbc_checks

3. Finally, execute "docker run" mapping your odbc.ini to /etc/odbc.ini::

```
docker run -d -v /root/odbc.ini:/etc/odbc.ini luanarndt/zabbix-proxy-odbc
```

Change the "/root/odbc.ini" according to the path of your odbc.ini.

---

Special thanks to Julio Dobkovski, for sharing the step-by-step on the Zabbix Forum:
https://www.zabbix.com/forum/zabbix-help/413055-installation-and-configuration-of-mssql-by-odbc-docker
