## 🔸 **Exercise 1: Create a Project User with a Dedicated Group**

**Goal**: Create user `jean` for a web project with a custom shell, a dedicated group, and secured access.

Steps:
1. Create user `jean` with a home directory and set the shell to `/bin/bash`.
2. Create group `projetweb` and add `jean` to it.
3. Add `jean` to the `sudo` group.
4. Set a password for `jean`.
5. Verify configuration with `id`, `groups`, `getent passwd`.
6. Temporarily lock the account.

---

### 🔸 **Exercise 2: Manage Secondary Groups**

**Goal**: Manage group memberships for a multi-project collaborator.

Steps:
1. Create groups `devops`, `infra`, and `design`.
2. Create user `alice` without a home directory.
3. Add `alice` to all three groups.
4. Remove `alice` from the `design` group.
5. Completely delete the `alice` account.

---

### 🔸 **Exercise 3: Customize Shell Environment**

**Goal**: Personalize a user's shell environment.

Steps:
1. Log in as user `jean`.
2. Customize the shell prompt (`PS1`) to show time and current directory.
3. Create an alias `update` that runs `sudo apt update && sudo apt upgrade -y`.
4. Set an environment variable `PROJET_DIR` pointing to `~/Documents/project`.
5. Apply changes immediately.
6. Make changes permanent in the appropriate config files.

---

### 🔸 **Exercise 4: Enforce Password Policy**

**Goal**: Enforce a secure password policy using PAM.

Steps:
1. Install `libpam-pwquality`.
2. Edit `/etc/security/pwquality.conf` with:
   ```
   minlen = 10
   dcredit = -1
   ucredit = -1
   lcredit = -1
   ocredit = -1
   ```
3. Set password expiration for user `jean` to 60 days.
4. Check password aging policy using `chage -l jean`.
5. Test password complexity by changing to a weak password.
