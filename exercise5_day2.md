### **Exercise**  
**Objective:**  
Understand and manage systemd service units and targets on Debian 12. This exercise will allow you to create, modify, and manage services, as well as use targets to manage groups of services during system startup.

As a system administrator, you are responsible for managing various services on a Debian 12 server. Some services must start automatically, others should be disabled, and you must also modify the target behavior to meet specific system requirements.

---

1. **Create a custom service unit:**  
   Create a custom systemd service that runs a simple script at startup. The script should log a message to the system logs.

2. **Enable and start the service:**  
   Enable the service so that it starts automatically at system boot. Then verify that the service is working properly by checking the logs.

3. **Disable an existing service:**  
   Identify a currently active service on the system that is not required for this exercise. Disable and stop this service so that it no longer starts automatically.

4. **Change the default systemd target:**  
   Change the default target from graphical mode to multi-user mode (text-only).  
   Reboot the system to confirm the change is effective.

5. **Create a new custom target:**  
   Create a custom systemd target that includes the service you created in step 1.  
   Start this target manually and ensure that your service starts correctly with this new target.

