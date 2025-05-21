#!/bin/bash

mkdir -p ~/.config/fish
ln -sf $(pwd)/fish/config.fish ~/.config/fish/config.fish
ln -sf $(pwd)/fish/git.fish ~/.config/fish/git.fish

mkdir -p ~/.config/hypr
ln -sf $(pwd)/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
ln -sf $(pwd)/hyprpaper/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

mkdir -p ~/Documents/wallpaper
ln -sf $(pwd)/hyprpaper/tree_fog_background.jpg ~/Documents/wallpaper/tree_fog_background.jpg

mkdir -p ~/.config/kitty
ln -sf $(pwd)/kitty/kitty.conf ~/.config/kitty/kitty.conf

ln -sf $(pwd)/starship/starship.toml ~/.config/starship.toml

mkdir -p ~/.config/waybar
ln -sf $(pwd)/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -sf $(pwd)/waybar/style.css ~/.config/waybar/style.css

ln -sf $(pwd)/nvim ~/.config/nvim