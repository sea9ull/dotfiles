# dotfiles

## USEAGE

```bash
./init.sh
```

`active_list.txt` に書かれたアプリの設定を `repository/<app>/` から
`~/.config` などへシンボリックリンクします。

## マシンごとの差分 (hosts/)

複数台で共通の設定を使いつつ、マシン固有の設定だけを分けられます。
`init.sh` はホスト名 (`uname -n`) で以下を自動的に切り替えます。

- `hosts/<hostname>/active_list.txt` があれば、ルートの `active_list.txt`
  より優先して使う(マシンごとに有効化するアプリを変えられる)
- `hosts/<hostname>/<app>/config/...` にあるファイルは、共通設定のリンクを
  張った**後に**同じリンク先へ上書きリンクする(ファイル単位の差し替え)

例: このリポジトリでは `hosts/GlossyGorilla/hypr/config/monitors.lua` が
共通の `repository/hypr/config/monitors.lua`(フォールバック)を上書きします。
モニタ構成や入力デバイスなどマシン固有の設定はここに置いてください。

新しいマシンでの導入手順:

```bash
git clone <このリポジトリ> ~/env/dotfiles
cd ~/env/dotfiles
mkdir -p hosts/$(uname -n)
cp active_list.txt hosts/$(uname -n)/active_list.txt   # 必要に応じて編集
./init.sh
```

### 日常の同期

設定ファイルはシンボリックリンクなので、編集はそのままリポジトリの
変更になります。編集前に pull、編集後はこまめに push してください。

```bash
git pull --rebase   # 作業を始める前
git add -p && git commit && git push   # 設定を変えたら
```

## Wi-Fi (wofi + iwd)

`wofi`、Python 3、起動済みの `iwd` が必要です。`active_list.txt` に
`wofi` を追加して `./init.sh` を実行すると、次のコマンドで起動できます。
リポジトリから直接 `./repository/wofi/config/wifi` を実行しても利用できます。

```bash
~/.config/wofi/wifi
```

ネットワークの検索・接続、切断、インターフェースのオン・オフに対応します。
複数の無線インターフェースがある場合は最初に選択します。Escでキャンセルできます。
保存済みの認証情報を先に試し、PSK接続に失敗するとパスワード入力を表示します。
パスワードは画面上でマスクしますが、`iwctl --passphrase` に渡す間はプロセスの
引数に含まれます。802.1Xは事前にiwdの `.network` ファイルで設定してください。
操作権限はiwdのD-Bus/polkit設定に従います。

iwdはWi-Fiの認証を担当します。IPアドレスとDNSは、既存の
systemd-networkdなどで設定するか、iwdの内蔵ネットワーク設定を使用してください。
systemd-networkdでDHCPを使う場合の例（インターフェース名は環境に合わせて変更）:

```ini
# /etc/systemd/network/25-wireless.network
[Match]
Name=wlan0

[Network]
DHCP=yes
```

DNSはsystemd-resolvedなどとの連携設定が別途必要です。
iwdの内蔵ネットワーク設定とsystemd-networkdで同じインターフェースの
IP設定を重複管理しないでください。このスクリプトはシステムのサービス設定を変更しません。

## picrop (画像編集)

切り抜き・リサイズ・90度回転・反転だけのシンプルな画像編集GUIです。
`python-pyside6` と `python-pillow` が必要です。JPEG/PNG/WebP/BMPに対応し、
EXIF（撮影情報）とICCプロファイルは保存時に引き継ぎます。

```bash
./repository/scripts/picrop 写真.jpg
```

PATHに置く場合とファイルマネージャから開けるようにする場合:

```bash
ln -s ~/env/dotfiles/repository/scripts/picrop ~/.local/bin/picrop
ln -s ~/env/dotfiles/repository/scripts/picrop.desktop ~/.local/share/applications/picrop.desktop
```

主なキー操作: `C` 切り抜き開始（ドラッグで範囲作成、`M` 中央揃え、`Enter` 適用、`Esc` 取消）、
`R` / `Shift+R` 右・左回転、`H` / `V` 左右・上下反転、`Ctrl+Z` / `Ctrl+Y` 取り消し・やり直し、
`Ctrl+S` 上書き保存、`Ctrl+Shift+S` 別名保存、`Ctrl+ホイール` ズーム、`0` 全体表示、`1` 等倍。
