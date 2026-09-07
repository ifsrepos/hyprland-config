#!/bin/bash
# Install hyprland-config to a new system

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
BIN_DIR="$HOME/.local/bin"

echo "Installing Hyprland configuration..."

# Create necessary directories
mkdir -p "$CONFIG_DIR"
mkdir -p "$BIN_DIR"

# Remove old directories if they exist (but not if they're already symlinks)
for dir in hypr rofi; do
    if [ -d "$CONFIG_DIR/$dir" ] && [ ! -L "$CONFIG_DIR/$dir" ]; then
        echo "Warning: $CONFIG_DIR/$dir already exists. Backing up to ${dir}.bak"
        mv "$CONFIG_DIR/$dir" "$CONFIG_DIR/${dir}.bak"
    fi
done

# Remove old scripts if they're not symlinks
for script in rofi-wifi rofi-bluetooth; do
    if [ -f "$BIN_DIR/$script" ] && [ ! -L "$BIN_DIR/$script" ]; then
        echo "Warning: $BIN_DIR/$script already exists. Backing up to ${script}.bak"
        mv "$BIN_DIR/$script" "$BIN_DIR/${script}.bak"
    fi
done

# Create symlinks
ln -sfn "$REPO_DIR/hypr" "$CONFIG_DIR/hypr"
ln -sfn "$REPO_DIR/rofi" "$CONFIG_DIR/rofi"
ln -sfn "$REPO_DIR/.local/bin/rofi-wifi" "$BIN_DIR/rofi-wifi"
ln -sfn "$REPO_DIR/.local/bin/rofi-bluetooth" "$BIN_DIR/rofi-bluetooth"

# Make scripts executable
chmod +x "$REPO_DIR/.local/bin/rofi-wifi"
chmod +x "$REPO_DIR/.local/bin/rofi-bluetooth"

echo "✓ Configuration installed successfully!"
echo ""
echo "Symlinks created:"
ls -la "$CONFIG_DIR/hypr" "$CONFIG_DIR/rofi" "$BIN_DIR/rofi-wifi" "$BIN_DIR/rofi-bluetooth"
echo ""
echo "Note: wpa_cli requires sudoers configuration for passwordless execution:"
echo "  echo \"$USER ALL=(ALL) NOPASSWD: /sbin/wpa_cli\" | sudo tee /etc/sudoers.d/wpa_cli"
