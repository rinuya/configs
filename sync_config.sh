#!/bin/bash

# Run this script in the root of this repository to properly save all files

# bash_aliases
cp ~/.bash_aliases bash/.bash_aliases

# nvim
cp -r ~/.config/nvim/ .

# i3
cp ~/.config/i3/config i3/config