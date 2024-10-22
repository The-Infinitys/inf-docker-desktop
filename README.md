# inf-docker-desktop

## 何これ

これはDockerを使ってGUI環境でUbuntuを触るために作成されたdocker imageです。

## どういうものか

[Chrome remote desktop]()を用いて、[Docker]()で構築したコンテナにアクセスし、スマホでも、タブレットでもブラウザさえあればどの端末でもUbuntuを触ることができます。

## 特徴

OSはUbuntuの最新版が使用できるようになっており、予めChromeがインストールされています。
また、フォントやibusが最初からインストールされ、起動してすぐに使えるようになっています。
どこでミスをしたのかは知りませんが、`--no-sandbox`でないとアプリが起動しません

(´∞ω∞)だれか解決方法を教えてください

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
