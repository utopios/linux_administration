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
```bash
sudo pvcreate /dev/sdc

### LIST pv
sudo pvs

```
3. **Create a Volume Group (VG)** from the physical volume.

```bash
sudo vgcreate vgtraining /dev/sdc

### LIST vg
sudo vgs

```

4. **Create a Logical Volume (LV)** within the volume group.

```bash
sudo lvcreate -L 10G lvdata vgtraining

### LIST pv
sudo lvs

```

5. **Format the Logical Volume** using a Linux file system (e.g., `ext4`).

```bash
sudo mkfs.ext4 /dev/vgtraining/lvdata

```

6. **Mount the Logical Volume** to a directory (e.g., `/mnt/data`).

```bash
sudo mkdir /mnt/lvdata

sudo mount /dev/vgstraining/lvdata /mnt/lvdata

```

7. **Configure permanent mounting** using the `/etc/fstab` file.


```bash
sudo blkid /dev/vgstraining/lvdata

sudo nano /etc/fstab

UUID="" /mnt/lvdata ext4 defaults 0 2

```

8. **Perform verification**:
   - Ensure the volume is mounted correctly.
   - Reboot and check if the mount persists.

