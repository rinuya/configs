#!/bin/bash

cd ~
sudo apt update

# Select OS
options=("Ubuntu" "Xubuntu")

select choice in "${options[@]}"; do
    case $choice in
        "Ubuntu")
            echo "Using Ubuntu settings"
            OS="Ubuntu"
            break
            ;;
        "Xubuntu")
            echo "Using Xubuntu settings"
            OS="Xubuntu"
            break
            ;;
        *) 
            echo "Stopping process.."
            exit 1
            ;;
    esac
done

############################################################################
#     _   __                _         
#    / | / /__  ____ _   __(_)___ ___ 
#   /  |/ / _ \/ __ \ | / / / __ `__ \
#  / /|  /  __/ /_/ / |/ / / / / / / /
# /_/ |_/\___/\____/|___/_/_/ /_/ /_/ 
#
############################################################################
# https://github.com/neovim/neovim
printf "\n"
read -p "Install Neovim? (Y/N) " WANT_NVIM

case "$WANT_NVIM" in 
    [yY] | [yY][eE][sS])
        echo "Installing Neovim..."

        # Install Build-Prerequesites
        sudo apt install ninja-build gettext cmake unzip curl git

        # Build Neovim
        # https://github.com/neovim/neovim/wiki/Building-Neovim

        git clone https://github.com/neovim/neovim

        cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfocd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfocd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

        sudo make install

        ;;
    *)
        echo "Skipping Neovim"
        ;;
esac

# Optional Nerd-Font
printf "\nMake sure you use a Nerdfont to properly display everything!"

############################################################################
#    ______                  __     ________                            
#   / ____/___  ____  ____ _/ /__  / ____/ /_  _________  ____ ___  ___ 
#  / / __/ __ \/ __ \/ __ `/ / _ \/ /   / __ \/ ___/ __ \/ __ `__ \/ _ \
# / /_/ / /_/ / /_/ / /_/ / /  __/ /___/ / / / /  / /_/ / / / / / /  __/
# \____/\____/\____/\__, /_/\___/\____/_/ /_/_/   \____/_/ /_/ /_/\___/ 
#                  /____/                                               
#
############################################################################
printf "\n"
read -p "Install GoogleChrome? (may be outdated) (Y/N) " WANT_GOOGLECHROME

case "$WANT_GOOGLECHROME" in 
    [yY] | [yY][eE][sS])
        echo "Installing GoogleChrome..."

        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

        sudo apt install ./google-chrome-stable_current_amd64.deb

        rm google-chrome-stable_current_amd64.deb

        ;;
    *)
        echo "Skipping GoogleChrome"
        ;;
esac

############################################################################
#    __                      
#   / /_____ ___  __  ___  __
#  / __/ __ `__ \/ / / / |/_/
# / /_/ / / / / / /_/ />  <  
# \__/_/ /_/ /_/\__,_/_/|_|  
#
############################################################################

read -p "Install tmux? (Y/N) " WANT_TMUX

case "$WANT_TMUX" in 
    [yY] | [yY][eE][sS])
        echo "Installing tmux..."
        sudo apt install tmux
        ;;
    *)
        echo "Skipping tmux"
        ;;
esac
                        
############################################################################
#     _ _____                 
#    (_)__  /      ______ ___ 
#   / / /_ < | /| / / __ `__ \
#  / /___/ / |/ |/ / / / / / /
# /_//____/|__/|__/_/ /_/ /_/ 
                            
############################################################################

read -p "Install i3wm? (Y/N) " WANT_I3

case "$WANT_I3" in 
    [yY] | [yY][eE][sS])
        echo "Installing i3..."
        sudo apt install i3
        ;;
    *)
        echo "Skipping i3"
        ;;
esac


# BAT
read -p "Install bat (batcat)? (Y/N) " WANT_BAT

case "$WANT_BAT" in
    [yY] | [yY][eE][sS])
        echo "Installing bat..."
        sudo apt install bat
        # create symlink alias
        mkdir -p ~/.local/bin
        ln -s /usr/bin/batcat ~/.local/bin/bat
        ;;
    *)
        echo "Skipping bat"
        ;;
esac

# STARSHIP

read -p "Install starship (NOTE: installing via script @ https://starship.rs/install.sh!!)? " WANT_STARSHIP

case "$WANT_STARSHIP" in
    [yY] | [yY][eE][sS])
        echo "Installing starship..."
        # Step 1: Install Starship
        curl -sS https://starship.rs/install.sh | sh
        # Step 2: Setup shell to use Starship (bash)
        echo 'eval "$(starship init bash)"' >> ~/.bashrc
        ;;
    *)
        echo "Skipping starship"
        ;;:
esac

