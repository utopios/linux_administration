# Task 1

/usr/local/bin/backup_gitea.sh
```bash
#!/bin/bash
BACKUP_DIR="/var/backups/gitea"
DATE=$(date +%F)
mkdir -p $BACKUP_DIR
tar -czvf $BACKUP_DIR/gitea_backup_$DATE.tar.gz /var/lib/gitea
```

sudo chmod +x /usr/local/bin/backup_gitea.sh

echo "0 1 * * * root /usr/local/bin/backup_gitea.sh" | sudo tee -a /etc/crontab

# Task 2

/usr/local/bin/cleanup_backups.sh

```bash
#!/bin/bash
find /var/backups/gitea/ -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;
```

sudo chmod +x /usr/local/bin/cleanup_backups.sh

echo "0 2 * * 0 root /usr/local/bin/cleanup_backups.sh" | sudo tee -a /etc/crontab

# Task 3

/etc/systemd/system/gitea-backup.service

```ini
[Unit]
Description=Manual Gitea Backup

[Service]
Type=oneshot
ExecStart=/usr/local/bin/backup_gitea.sh

[Install]
WantedBy=multi-users.target

```

/etc/systemd/system/gitea-backup.timer

```ini
[Unit]
Description=Daily Gitea Backup Timer

[Timer]
OnCalendar=*-*-* 01:00:00
Persistent=true

[Install]
WantedBy=timers.target

```

sudo systemctl daemon-reload
sudo systemctl enable --now gitea-backup.timer