#!/bin/bash

# Run this script in the root of this repository to properly save all files

# bash_aliases
cp bash/.bash_aliases ~/.bash_aliases

# nvim
cp -r nvim/ ~/.config/

# i3
cp i3/config ~/.config/i3/config