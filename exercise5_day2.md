### **Exercise**  
**Objective:**  
Understand and manage systemd service units and targets on Debian 12. This exercise will allow you to create, modify, and manage services, as well as use targets to manage groups of services during system startup.

As a system administrator, you are responsible for managing various services on a Debian 12 server. Some services must start automatically, others should be disabled, and you must also modify the target behavior to meet specific system requirements.

---

1. **Create a custom service unit:**  
   Create a custom systemd service that runs a simple script at startup. The script should log a message to the system logs.

```bash
sudo nano /usr/local/bin/custom-startup.sh
```

```bash
#!/bin/bash
logger "Custom Startup Service: The system has booted successfully!"
```

```bash
sudo chmod +x /usr/local/bin/custom-startup.sh
```

2. **Enable and start the service:**  
   Enable the service so that it starts automatically at system boot. Then verify that the service is working properly by checking the logs.

```bash
sudo nano /etc/systemd/system/custom-startup.service
```

```ini
[Unit]
Description=Custom Startup Logging Service
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/custom-startup.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl start custom-startup.service
sudo systemctl status custom-startup.service
```


3. **Disable an existing service:**  
   Identify a currently active service on the system that is not required for this exercise. Disable and stop this service so that it no longer starts automatically.

```bash
sudo systemctl list-units --type=service --state=running
```

4. **Change the default systemd target:**  
   Change the default target from graphical mode to multi-user mode (text-only).  
   Reboot the system to confirm the change is effective.

```bash
sudo systemctl get-default
```

5. **Create a new custom target:**  
   Create a custom systemd target that includes the service you created in step 1.  
   Start this target manually and ensure that your service starts correctly with this new target.

```bash
sudo nano /etc/systemd/system/custom.target
```


```ini
[Unit]
Description=Custom Target for Specific Services
Requires=custom-startup.service
After=custom-startup.service

[Install]
WantedBy=multi-user.target
```

```bash
sudo mkdir /etc/systemd/system/custom.target.wants
```

```bash
sudo ln -s /etc/systemd/system/custom-startup.service /etc/systemd/system/custom.target.wants/
```