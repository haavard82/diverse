#!/bin/zsh

#!/bin/zsh

# ============================================
# Script Name:     init_template.sh
# Description:     Dette scriptet initialiserer template VMen
# Author:          HKO
# Version:         1.0
# Last Updated:    2024-08-30
# ============================================

# Usage:
#   -- Scriptet lastes automatisk vha ~/Library/LaunchAgents/com.admin.init-template.plist

# Options:
#   -h, --help        Display this help message and exit
#   -v, --version     Show version information

# ============================================
# Variable Declarations
# ============================================

# Script version
version="1.0"

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# ============================================
# Function Definitions
# ============================================


show_welcome(){
    # ASCII Art Logo
    echo -e "${GREEN}"
    echo " __          __        _    _           _     "
    echo " \ \        / /       | |  | |         | |    "
    echo "  \ \  /\  / /__  _ __| | _| |     __ _| |__  "
    echo "   \ \/  \/ / _ \| '__| |/ / |    / _\` | '_ \ "
    echo "    \  /\  / (_) | |  |   <| |___| (_| | |_) |"
    echo "     \/  \/ \___/|_|  |_|\_\______\__,_|_.__/ "
    echo -e "${NC}"

    # Welcome message
    echo -e "${YELLOW}Welcome to bootstrap.sh v1.0${NC}"
    echo "-----------------------------------"
    echo "Dette scriptet laster ned initscriptet som setter opp template VMen"
}

# Show help if requested
show_help() {
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "  -h, --help        Display this help message and exit"
    echo "  -v, --version     Show version information"
    echo
}

show_version(){
    echo "Version: $version"
}

# ============================================
# Main Execution
# ============================================

# Laster ned init_template.sh som installerer SW og config på templaten
curl https://raw.githubusercontent.com/haavard82/bootstrap/refs/heads/main/init_template.sh --output $HOME/init_template.sh
curl https://raw.githubusercontent.com/haavard82/bootstrap/refs/heads/main/config.yaml --output $HOME/config.yaml
chmod +x $HOME/init_template.sh

# Kjører init_template.sh
# Malen er en helt clean macOS VM som kun har blitt konfigurert med passordfri autoinnlogging, samt farge på skrivebordsbakgrunne.
open -a Terminal $HOME/init_template.sh
