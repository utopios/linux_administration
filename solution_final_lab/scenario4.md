# Task 1
sudo apt install - htop
htop

# Task 2
sudo renice +5 $(pidof nginx)

/usr/local/bin/manage_services.sh

```bash
#!/bin/bash
case $1 in
  start) sudo systemctl start gitea ;;
  stop) sudo systemctl stop gitea ;;
  restart) sudo systemctl restart gitea ;;
  *) echo "Usage: $0 {start|stop|restart}" ;;
esac

```