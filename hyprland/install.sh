#!/bin/bash

mkdir -p ~/.config/fish
ln -sfn $(pwd)/fish/config.fish ~/.config/fish/config.fish
ln -sfn $(pwd)/fish/git.fish ~/.config/fish/git.fish

mkdir -p ~/.config/hypr
ln -sfn $(pwd)/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
ln -sfn $(pwd)/hyprlock/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -sfn $(pwd)/hyprpaper/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

mkdir -p ~/Documents/wallpaper
ln -sfn $(pwd)/hyprpaper/tree_fog_background.jpg ~/Documents/wallpaper/tree_fog_background.jpg

mkdir -p ~/.config/kitty
ln -sfn $(pwd)/kitty/kitty.conf ~/.config/kitty/kitty.conf

ln -sfn $(pwd)/starship/starship.toml ~/.config/starship.toml

mkdir -p ~/.config/waybar
ln -sfn $(pwd)/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -sfn $(pwd)/waybar/style.css ~/.config/waybar/style.css

ln -sfn $(pwd)/nvim ~/.config/nvim

ln -sfn $(pwd)/kanshi ~/.config/kanshi
