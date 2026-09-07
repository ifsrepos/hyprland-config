#!/bin/bash

"Installing system dependencies..."
sudo apt update && xargs -a apt_requirements.txt sudo apt install -y

