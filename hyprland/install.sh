#!/bin/bash

mkdir -p ~/.config/fish
cp fish/config.fish ~/.config/fish/config.fish
cp fish/git.fish ~/.config/fish/git.fish

mkdir -p ~/.config/hypr
cp hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
cp hyprpaper/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

mkdir -p ~/Documents/wallpaper
cp hyprpaper/tree_fog_background.jpg ~/Documents/wallpaper/tree_fog_background.jpg

mkdir -p ~/.config/kitty
cp kitty/kitty.conf ~/.config/kitty/kitty.conf

cp starship/starship.toml ~/.config/starship.toml

mkdir -p ~/.config/waybar
cp waybar/config.jsonc ~/.config/waybar/config.jsonc
cp waybar/style.css ~/.config/waybar/style.css