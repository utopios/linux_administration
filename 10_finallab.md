
# **Final Lab: System Administration on Debian – Real-World Scenarios**

## **General Context:**

You have recently joined **TechCorp**, a company specializing in software solutions, as a System Administrator. Your role is to set up, configure, secure, and maintain the company's server infrastructure using Debian. You will implement various services to support development activities, ensure security, automate routine tasks, manage resources efficiently, and establish reliable backup strategies.

Your mission is to apply best practices in system administration to deliver a robust and secure environment tailored to the company's operational needs.

---

## **Scenario 1: Setting Up a Development Server**

### **Objective:**
Deploy and configure a Debian server to support the development team with essential tools for collaboration, version control, and project management.

### **Tasks:**

1. **User and Group Management:**
   - Create a group named `developpeurs`.
   - Add users `alice` and `bob` to this group.
   - Set `bash` as the default shell for all users.

2. **Install Development Tools:**
   - Install `git` for version control.
   - Install `docker` for containerized application deployment.
   - Install `nginx` to host internal documentation.

3. **Server Hardening:**
   - Configure `ufw` to allow:
     - SSH (on a custom port for security).
     - HTTP (port 80 for `nginx`).
     - Any required `docker` ports.
   - Block all other incoming connections.
   - Secure SSH:
     - Disable root login.
     - Restrict SSH access to `devadmin` and `alice`.
     - Set up SSH key authentication for `devadmin`.

4. **Project Management System Setup:**
   - Install `Gitea` from a binary archive.
   - Configure it as a `systemd` service.
   - Use `sqlite` as the database backend.
   - Ensure `Gitea` starts on boot and is accessible at `http://dev-server`.

---

## **Scenario 2: Task Automation and Backup Scheduling**

### **Objective:**
Automate repetitive administrative tasks and implement a backup system to protect critical data.

### **Tasks:**

1. **Automated Backups with `cron`:**
   - Create a script `backup_gitea.sh` to:
     - Backup `Gitea` repositories.
     - Compress backups with a timestamped filename.
     - Store them in `/var/backups/gitea/`.
   - Schedule this script to run daily at 1:00 AM.

2. **Automated Cleanup of Old Backups:**
   - Write `cleanup_backups.sh` to delete backups older than 7 days.
   - Schedule it to run every Sunday at 2:00 AM.

3. **Integrate with `systemd`:**
   - Define a `systemd` service for manual execution of the backup script.
   - Create a `systemd` timer as an alternative to `cron` for centralized task management.

---

## **Scenario 3: Permissions Management and Security**

### **Objective:**
Ensure sensitive project data is properly secured, with controlled access based on user roles.

### **Tasks:**

1. **Project Directory Access Control:**
   - Create `/srv/projects`.
   - Assign ownership to the `developpeurs` group.
   - Set permissions so that:
     - Group members can read, write, and execute.
     - No access is granted to other users.

2. **Implement ACLs for Specific Access Needs:**
   - Grant user `charlie` (not part of `developpeurs`) read-only access to `/srv/projects`.
   - Verify effective permissions for all users.

3. **SSH Key Security Policy:**
   - Enforce secure storage of user SSH keys.
   - Ensure all private keys are protected with passphrases.

---

## **Scenario 4: Process Management and Resource Optimization**

### **Objective:**
Monitor and manage server processes to optimize resource usage and maintain high availability.

### **Tasks:**

1. **Monitor System Resources:**
   - Use `htop` to observe CPU and memory consumption.
   - Identify resource-intensive processes.

2. **Process Prioritization and Control:**
   - Adjust the `nice` value to lower the priority of other background services, ensuring `Gitea` has higher priority.
   - Write a script to start, stop, or restart `Gitea` and other services using appropriate signals.


---

## **Scenario 5: Database Backup and Restoration**

### **Objective:**
Implement a backup and recovery plan for service databases to ensure data integrity in case of failure.

### **Tasks:**

1. **Backup `Gitea`'s SQLite Database:**
   - Develop a script to:
     - Temporarily stop the `Gitea` service.
     - Copy the SQLite database file to a secure backup directory.
     - Restart the `Gitea` service.
   - Schedule this backup to run nightly at 3:00 AM.

2. **Perform a Restoration Test:**
   - Simulate a database recovery in a test environment.
   - Validate the integrity and functionality of the restored data.
