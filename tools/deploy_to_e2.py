import subprocess

E2_IP = "192.168.1.50"
E2_USER = "root"
LOCAL_FILE = "hosts/host_mywebsite.py"
REMOTE_PATH = "/usr/lib/enigma2/python/Plugins/Extensions/IPTVPlayer/hosts/"

def deploy():
    subprocess.run([
        "scp", LOCAL_FILE,
        f"{E2_USER}@{E2_IP}:{REMOTE_PATH}"
    ])
    subprocess.run([
        "ssh", f"{E2_USER}@{E2_IP}",
        "killall -9 enigma2"
    ])

if __name__ == "__main__":
    deploy()
