#!/bin/sh

HOSTS_DIR="/usr/lib/enigma2/python/Plugins/Extensions/IPTVPlayer/hosts"
TMP_DIR="/tmp/private_hosts_update"
REPO_RAW="https://raw.githubusercontent.com/rachidb13/e2-private-host/main/hosts"

echo "[+] Updating private IPTVPlayer hosts..."

rm -rf $TMP_DIR
mkdir -p $TMP_DIR
cd $TMP_DIR || exit 1

# List of hosts (explicit = safe)
HOSTS="host_mywebsite.py"

for h in $HOSTS; do
    echo "[+] Downloading $h"
    wget -q "$REPO_RAW/$h" -O "$h" || {
        echo "[!] Failed to download $h"
        continue
    }
    cp "$h" "$HOSTS_DIR/$h"
done

echo "[+] Update finished"
echo "[+] Restarting Enigma2..."

killall -9 enigma2
