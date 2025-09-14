# EelyOSHelper

**EelyOSHelper** is a terminal-based assistant script designed to give you lightweight OS support straight from the command line. With its eel-themed ASCII welcome and modular menu system, it acts as your personal helper for system checks, backups, cleanup, scheduling simulations, and network utilities - all from a single interface.

---

## Features

Stylish ASCII eel intro  
Interactive terminal menu  
Built-in logging system (`log.txt`)  
Folder backup with ZIP compression  
Round-Robin CPU scheduling simulation (Python)  
Temp file cleanup  
Memory & hardware monitoring  
Network diagnostics: ping, netstat, nslookup

---

## Menu Preview

```bash
1. View system status
2. Backup folder
3. Process Scheduling Simulation
4. Clean temp folder and log action
5. View log.txt
6. Hardware Info
7. Memory Monitor
8. Network Tools
9. Quit
```

## Getting Started
1. **Clone or download** the repo.
2. Make sure the script is executable:
   ```bash
   chmod +x helper.sh
   ```
3. Then simply run:
   ```bash
   ./helper.sh
   ```

---

## Requirements
- Unix-based system (Linux, macOS, WSL, etc.)
- `bash` shell
- Python 3
- Required commands: `zip`, `top`, `ps`, `netstat`, `nslookup`, `lscpu`, `find`, etc.
Make sure your system supports:
- `zip` for backups
- `net-tools` or `iproute2` for networking info
- `round-robin-sim.py` and `pingmap.py` (included in this repo)

---

## License
MIT License - free to use, modify, and learn from.

## Future Ideas
- Add TUI (Text User Interface) with `dialog` or `whiptail`
- Auto-detect and color system load
- Extend with more OS simulation tools