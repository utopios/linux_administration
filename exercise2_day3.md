### **Exercise: Task Scheduling with cron and at**

**Objective**: Use `cron` to schedule recurring tasks and `at` for one-time tasks.

---

### **Exercise Steps**

1. **Create a One-Time Task**
   - Schedule a message to be displayed in the terminal in 2 minutes.

   ```bash
   echo "hello from ubuntu" >> /home/vagrant/at.txt | at now + 2 minutes
   ```

2. **Schedule a Daily Cleanup with cron**
   - Use `cron` to schedule a daily task that deletes all files in a temporary directory (`/tmp/mytemp`) at 2 AM.

3. **Create a Weekly Reminder with cron**
   - Configure `cron` to display a reminder every Monday at 9 AM by sending a message to the terminal. For example: "It's time for the weekly meeting!"

   ```bash
   0 9 * * 1 echo "It's time for the weekly meeting!" >> /dev/pts/0
   ```

4. **Set Up a Monthly Backup with cron**
   - Create a `cron` task that copies a specific folder (`/home/user/documents`) to a backup folder (`/home/user/backup`) on the 1st day of each month at 3 AM.

   ```bash
   0 3 1 * * cp -r /home/user/documents /home/user/backup
   ```


5. **List and Check cron and at Tasks**
   - Display the list of configured `cron` tasks and check the scheduled `at` tasks.
