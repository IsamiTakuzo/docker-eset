# Dockerized ESET PROTECT 9.x

This product fork from blacksmith/docker-eset

Next version of Eset Security Management Center.

MySQL DB + Server + Web Console

## QuickStart

### Installation

  1. install docker + docker-compose (or compose plugins)
  2. get Server-Linux-x86_64.sh and era.war from ESET or your agency.
  3. Copy Server-Linux-x86_64.sh ./docker-eset-era-server/
  4. Copy era.war ./docker-eset-era-console/
  5. copy .env.sample to .env
  6. edit .env and setup eviroments
  7. enable ports 2222/tcp and 8080/tcp
  8. run docker-compose
```
     docker-compose up
```
  6. installation takes few minutes
  7. after that test server 
  8. create file /etc/systemd/system/eset.service and set WorkingDirectory. 
```
[Unit]
Description=Eset Managment 
After=network.target docker.service
[Service]
WorkingDirectory=/srv/eset
ExecStart=/usr/local/bin/docker-compose up
ExecStop=/usr/local/bin/docker-compose down
Restart=always
[Install]
WantedBy=multi-user.target
```
  9. Enable and start service 
```
systemctl enable eset.service 
systemctl start eset.service
```

