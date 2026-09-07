# Hyprland Configuration

A clean, modular Hyprland configuration with rofi-based menus for WiFi, Bluetooth, and application launching.

## Features

- **Hyprland window manager** with Vim-style keybindings
- **rofi-wifi**: Smart WiFi network selector with signal strength sorting
- **rofi-bluetooth**: Full Bluetooth device management (pair, connect, power toggle)
- **rofi drun**: Application launcher with nord theme
- **Modular config**: All configuration split into logical files (keybinds, window rules, etc.)

## Installation

```bash
./install.sh
```

This creates symlinks to all configuration files and scripts from your `~/.config` and `~/.local/bin` directories.

## Configuration Files

- `hypr/hyprland.conf` - Main Hyprland configuration
- `hypr/keybinds.conf` - Keyboard shortcuts (Super+key based)
- `hypr/hypridle.conf` - Idle timeout rules
- `hypr/hyprlock.conf` - Lock screen configuration
- `hypr/hyprpaper.conf` - Wallpaper settings
- `rofi/config.rasi` - Rofi main configuration
- `rofi/themes/` - Rofi theme files

## Scripts

### rofi-wifi
Connect to WiFi networks using wpa_supplicant.

**Features:**
- Scan and list available networks sorted by signal strength
- Store passwords for previously-connected networks
- Connect to known networks without re-entering password

**Setup:**
```bash
echo "$USER ALL=(ALL) NOPASSWD: /sbin/wpa_cli" | sudo tee /etc/sudoers.d/wpa_cli
```

**Keybinding:** `Super+W`

### rofi-bluetooth
Manage Bluetooth devices.

**Features:**
- Toggle Bluetooth power on/off
- Connect/disconnect to paired devices
- Scan for new devices and pair them

**Keybinding:** `Super+B`

## Keybindings

**System:**
- `Super+SPACE` - Application launcher
- `Super+W` - WiFi menu
- `Super+B` - Bluetooth menu
- `Super+ENTER` - Terminal
- `Super+Q` - Close window
- `Super+ESCAPE` - Exit Hyprland
- `Super+SUPR` - Lock screen

**Window Navigation (Vim-style):**
- `Super+H/J/K/L` - Focus left/down/up/right
- `Super+SHIFT+H/J/K/L` - Move window
- `Super+CTRL+H/J/K/L` - Resize window

**Workspaces:**
- `Super+1-9` - Switch workspace
- `Super+SHIFT+1-9` - Move window to workspace
- `Super+CTRL+1-9` - Move window to workspace (silent)

**Audio:**
- `XF86AudioRaiseVolume` - Increase volume
- `XF86AudioLowerVolume` - Decrease volume
- `XF86AudioMute` - Toggle mute

## Dependencies

- `hyprland` - Window manager
- `rofi` - Application launcher and menu system
- `wpa_supplicant` (with `wpa_cli`) - WiFi management
- `bluez` (with `bluetoothctl`) - Bluetooth management
- `wpctl` (from pipewire) - Audio control
- `hyprlock` - Lock screen
- `hyprpaper` - Wallpaper daemon
- `hypridle` - Idle daemon

## Usage

After installation, your configuration is managed through symlinks. To update:

1. Make changes to files in `~/.config/hyprland-config/`
2. Changes are automatically reflected in `~/.config/hypr/`, `~/.config/rofi/`, etc.
3. Commit changes to git

## Directory Structure

```
hyprland-config/
├── hypr/                 # Hyprland configuration
│   ├── hyprland.conf
│   ├── keybinds.conf
│   ├── hypridle.conf
│   ├── hyprlock.conf
│   └── hyprpaper.conf
├── rofi/                 # Rofi configuration
│   ├── config.rasi
│   └── themes/           # Theme files
├── .local/bin/           # Executable scripts
│   ├── rofi-wifi
│   └── rofi-bluetooth
├── install.sh            # Installation script
└── README.md
```

## Notes

- Configuration follows the same pattern as nvim-config (git repo with symlinks)
- All paths are relative, allowing easy migration between systems
- Scripts use standard tools (wpa_cli, bluetoothctl) without heavy GUI dependencies
