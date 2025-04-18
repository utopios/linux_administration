## 🧪 **Lab: SUID, SGID, Sticky Bit and ACLs**

### 🎯 **Objective**

Set up and secure a shared development environment by:
- Applying standard permissions like **SUID**, **SGID**, and **Sticky Bit**
- Using **ACLs** to fine-tune access for specific users

---

## 📜 **Scenario**

You are a system administrator.  
A team called `devteam` collaborates in the `/srv/devproject` directory. You must:

- Allow team members to create, edit, and manage shared files
- Ensure files always belong to the correct group
- Prevent users from deleting each other’s files
- Give limited access to two external users: one in read-only, one in read-write
- Set default ACLs for inherited permissions

---

## 🧩 **Tasks**

### 🔧 PART 1 – Standard Group Collaboration Setup

1. Create a new group called `devteam`
2. Create the shared folder `/srv/devproject`
3. Ensure all files created inside inherit the group `devteam`
4. Add two users (`alice` and `bob`) to the group
5. Prevent users from deleting each other’s files
6. Ensure only members of the team can access the folder

---

### 🔒 PART 2 – Fine-Grained Access with ACLs

1. Create a file named `specs.txt` inside `/srv/devproject`
2. Give **read-only access** to user `carol`
3. Give **read and write access** to user `dan`
4. Make sure `specs.txt` is not accessible by other users

---

### 🚀 PART 3 – SUID Behavior (Simulation)

1. Copy an executable file into `/tmp`
2. Change its ownership to root
3. Set SUID on the file
4. Test the result as a regular user
5. Observe the permission string and execution behavior

---

### ⭐ BONUS – Default ACL Inheritance

Configure `/srv/devproject` so:
- Files created inside are automatically accessible by the group
- `carol` always has read-only access
- `dan` always has read/write access

