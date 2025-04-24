# Task 1
/usr/local/bin/backup_sqlite.sh

```bash
#!/bin/bash
BACKUP_DIR="/var/backups/gitea_db"
DATE=$(date +%F)
mkdir -p $BACKUP_DIR
sudo systemctl stop gitea
cp /var/lib/gitea/data/gitea.db $BACKUP_DIR/gitea_db_$DATE.sqlite
sudo systemctl start gitea

```

sudo chmod +x /usr/local/bin/backup_sqlite.sh

echo "0 3 * * * root /usr/local/bin/backup_sqlite.sh" | sudo tee -a /etc/crontab


## Task 2

sudo systemctl stop gitea
cp /var/backups/gitea_db/gitea_db_2024-04-22.sqlite /var/lib/gitea/data/gitea.db
sudo chown git:git /var/lib/gitea/data/gitea.db
sudo systemctl start gitea