# Komodo Periphery

Quick way to deploy periphery application for use with [Komodo](https://komo.do/)

## Usage

### Initial Setup

```bash
git clone <https://github.com/rahulsalvi/komodo_periphery.git>
sudo mkdir -p /etc/komodo
# obviously replace the passkey with something better
sudo echo "mysecurepasskey" >/etc/komodo/passkey
sudo chmod 600 /etc/komodo/passkey
sudo docker compose up -d
sudo ufw enable
```

### Updating

```bash
sudo docker compose pull
sudo docker compose up -d
sudo docker prune
```
