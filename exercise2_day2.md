## **Exercise LVM**

### 🎯 **Objective:**

In this lab, trainees will use **LVM (Logical Volume Manager)** to dynamically manage storage space in a **VirtualBox environment**.  
They will create a logical volume, format it with a file system, and then configure **permanent mounting** using both `fstab` and `systemd`.

---

### 🧰 **Prerequisites:**

- A working **VirtualBox environment** with a virtual machine running **Debian** or another Linux distribution.
- **Basic understanding** of partitions, file systems, and LVM.
- The virtual machine must have an **unallocated partition or additional virtual disk**.

---

### 📝 **Instructions:**

1. **Add an additional virtual disk** to the virtual machine via VirtualBox settings.
2. **Create a Physical Volume (PV)** using the new disk or partition.
3. **Create a Volume Group (VG)** from the physical volume.
4. **Create a Logical Volume (LV)** within the volume group.
5. **Format the Logical Volume** using a Linux file system (e.g., `ext4`).
6. **Mount the Logical Volume** to a directory (e.g., `/mnt/data`).
7. **Configure permanent mounting** using the `/etc/fstab` file.
8. **Perform verification**:
   - Ensure the volume is mounted correctly.
   - Reboot and check if the mount persists.

