# Dockerized ESET PROTECT 9.x

In English ,  see below.


このプロダクトはbkacksmith/docker-esetからフォークしたものです。

オリジナルがESMC7.2をターゲットしていたのを、ESET PROTECT9.0/9.1/10.0に修正したものです。
オリジナルにあった、該当バージョンのDBが存在する状態でUPするとサーバコンテナが再起動を繰り返す問題を修正しています。

## クイックスタート

### インストール手順

  1. dockerとdocker-compose(composeプラグイン）をホストに導入
  2. インストールするバージョンのServer-Linux-x86_64.shとera.warをESETもしくは代理店から入手
...
     日本国内だとCanon ITSが代理店です。 Component_Linux_x64.zipをダウンロード、展開してください

     Component_Linux_x64.zipには、Server-Linux-x86_64.shとera.warが含まれます。
...
  3. Server-Linux-x86_64.shを./docker-eset-era-server/にコピー
  4. era.shを./docker-eset-era-console/にコピー
  5. .env.sampleを.envにコピー
  6. .envの内容を環境に合わせて修正する（環境変数の設定）
  7. 2222/tcpと8080/tcpにそとからアクセスできるよう(FWを)設定
  8. docker-compose up してコンテナ生成
  9. 初回起動時にコンテナ内でインストール、DBのアップグレードが行われるので暫く待つ
  10. （Webコンソールからアクセスして）サーバをテストする
  11. /etc/systemd/system/eset/.serviceを作成して、サービス有効化する
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
  12. eser.serviceを起動時有効化する
```
systemctl enable eset.service 
systemctl start eset.service
```

## In English

This product is forked from blacksmith/docker-eset
This fork is used for ESET PROTECT 9.0/9.1/10.0

This fork was fixed that server container always reboot when DB table exists.

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
  9. installation takes few minutes
  10. after that test server 
  11. create file /etc/systemd/system/eset.service and set WorkingDirectory. 
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
  12. Enable and start service 
```
systemctl enable eset.service 
systemctl start eset.service
```

