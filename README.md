# inf-docker-desktop

## 何これ

これはDockerを使ってGUI環境でUbuntuを触るために作成されたdocker imageです。

## どういうものか

[Chrome remote desktop](https://remotedesktop.google.com/)を用いて、[Docker](https://www.docker.com)で構築したコンテナにアクセスし、スマホでも、タブレットでもブラウザさえあればどの端末でもUbuntuを使うことができるようになるというものです。

## 特徴

OSはUbuntuが使用できるようになっており、予めChromeやFirefox、vlcやgimpなどがインストールされています。
また、フォントやibusが最初からインストールされ、起動してすぐに使えるようになっています。

## 使い方
dockerをインストールし、
cdをこのリポジトリのルートにした状態で
コマンド
```bash
source ./build.sh
```
を実行してください。
その次に、chrome remote desktopを開き、**SSH経由でセットアップする**
を押し、
```
「開始」「次へ」「承認」
```
を押して、**別のパソコンを設定**
まできたら、debian linuxのコマンドをコピーし、
```
DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/xx" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname)
```
codeの引数をコピーします。そして、その値を`env.txt`の`CODE=`の先にペーストしてください。
そこまでできたら、あとは
```bash
source ./run.sh
```
を実行するだけです。上手くいけば、Chrome remote desktopからubuntuのGUI環境にアクセスできるようになります。

## メモメモ

アプデしました。gimpとかを最初からインストールするように()
