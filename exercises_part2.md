### 🔸 **Exercise 5: Install with APT and Handle Dependencies**

**Goal**: Install and remove a `.deb` package manually.

Steps:
1. Download the `htop` `.deb` file from the Ubuntu package archive.
2. Install it using `dpkg`.
3. Fix any dependency issues with `apt install -f`.
4. Completely remove `htop` using `apt`.


---

### 🔸 **Exercise 6: Test Snap and Flatpak Formats**

**Goal**: Compare Snap and Flatpak.

Steps:
1. Install VLC using **Snap**.
2. Remove it.
3. Install VLC using **Flatpak**.
4. Observe differences in execution paths and permissions.

---

### 🔸 **Exercise 7: Install from a Tarball Archive**

**Goal**: Manually install from a tar.gz file.

Steps:
1. Download a binary tarball of `neofetch` or `bat`.
2. Extract and move the binary to `/usr/local/bin`.
3. Run the program and ensure it’s globally accessible.
4. Clean up the install manually.

---

### 🔸 **Exercise 8: Compile from Source**

**Goal**: Compile `htop` or `btop` from source.

Steps:
1. Install build tools (`build-essential` or dev group).
2. Clone the source code:
   ```bash
   git clone https://github.com/aristocratos/btop.git
   ```
3. Compile using `make` or `cmake`.
4. Install to `/opt/btop`.
5. Add `/opt/btop` to the system’s `PATH`.