### **Exercise 1**

#### **Objective:**
To configure various mounts for local and virtual file systems using `fstab`, while exploring advanced mounting options for performance and security.

---

### **Tasks to Complete:**

---

#### **1. Mounting an ext4 disk with performance optimization:**

- Mount a local disk formatted with the **ext4** file system.
- Configure it in `/etc/fstab` using options that **optimize performance**, such as disabling `atime` and `nodiratime`.
- Reboot the system and verify that the disk is mounted correctly and the performance options are applied.

---

#### **2. Mounting a disk in read-only mode:**

- Mount another local disk in **read-only** mode via `/etc/fstab`.
- Ensure that even users with **root privileges** cannot remount this disk as writable without **modifying the `fstab` configuration**.
- Test this by attempting to write to the disk and confirming it is not allowed.

---

#### **3. Creating a `tmpfs` virtual file system for temporary files:**

- Create and configure a mount point for **`tmpfs`** in `/etc/fstab`, setting a **size limit** (e.g., 1 GB).
- Mount this file system in memory for storing temporary files.
- Ensure that it is **automatically mounted at boot** and that the **size limit is respected**.

---

#### **4. Enabling user quotas on a mounted disk (using the `quota` package):**

- Mount a local disk via `/etc/fstab`, enabling **user quotas**.
- Configure disk usage limits for individual users.
- Test the quota system by attempting to write data as different users and verifying that the limitations are enforced.

---

#### **5. Advanced permission management for a shared disk:**

- Mount a local disk via `/etc/fstab` with mount options such as `uid` and `gid`, so that a specific **user group** has **read and write** access.
- Confirm that the permissions behave as expected for users belonging to that group.
