# Bare repo
Bare repo created using https://www.atlassian.com/git/tutorials/dotfiles

# Hyprland
https://wiki.hyprland.org/Useful-Utilities/Must-have/

# References
* https://gitlab.com/stephan-raabe/dotfiles
* https://gitlab.com/thelinuxcast/my-dots
* https://github.com/zDyanTB/HyprNova
* https://github.com/justinmdickey/publicdots/tree/main
* https://www.reddit.com/r/hyprland/comments/1bhbypf/hypridle_hyprlock/
* https://colorhunt.co/palette/7f27ff9f70fdfdbf60ff8911
* Intellij flickering https://github.com/hyprwm/Hyprland/issues/3450 / https://github.com/hyprwm/Hyprland/issues/3450

# Current dependencies:

## Hyprland
hyprland hyprpaper hyprlock hypridle xdg-desktop-portal xdg-desktop-portal-hyprland waybar rofi-lbonn-wayland swaync pipewire pavucontrol grim slurp brightnessctl pamixer

## Network
network-manager network-manager-applet dnsutils dnsmasq

## Theme
papirus-icon-theme nerd-fonts breeze breeze-gtk nwg-look dracula

## Apps
kitty nemo nemo-fileroller keepassxc code gnome-font-viewer yazi

## Programming
docker docker-compose postman git gitflow-avh nvm jdk11-openjdk jdk21-openjdk

## Bluetooth
bluez bluez-utils

# Changing GTK themes:
More information:
* https://wiki.archlinux.org/title/Cursor_themes 
* https://www.youtube.com/watch?v=CF3UFxH8d0Y

## Changing theme:
* download theme and move to `/usr/share/themes`
* install and run `nwg-look` and change theme under `Widgets` tab

## Changing icons:
* download theme and move to `/usr/share/icons`
* install and run `nwg-look` and change theme under `Icon theme` tab

## Changing cursor:
* download cursor and move it to `/usr/share/icons`
* install and run `nwg-look` and change cursor under `Mouse cursor` tab
* edit `/usr/share/icons/default/index.theme` to match cursor directory
* create and edit `/home/USER/.icons/default/index.theme` to match cursor directory
* don't change anything in `.gtkrc-2.0`, this file will be overwritten by nwg-look

# Bug fixes and configurations

## Nemo open with doesn't work
* go to `/usr/share/applications`
* find `.desktop` file for application of choice
* edit exec ie. for vim change `Exec=vim %F` to `Exec=kitty -e vim %F`
* change `terminal` flag to `false`

# TODO:
* Hyprland config
    * Cleanup hyprland config
    * Configure hyprland keybindings
    * Split config into files
    * Add monitor profiles 3 monitors / single monitor
    * Configure cursor
    * Configure Fonts
* Stylize lock screen
* Add notifications
    * Configure different notification daemon for KDE and hyprland
    * Configure notifications to show only on main screen
* Add media center
* Add shut down, reboot etc. buttons
* Wallpaper changer
    * Configure wallpaper changing in hyprpaper or change to othet app
* Virtual desktopesque workspaces - https://github.com/levnikmyskin/hyprland-virtual-desktops
* Password between VMs - https://wiki.archlinux.org/title/Chromium#Force_a_password_store
    * Maybe use KeePassXC
* Configure styles to be similar in all application ie. terminal background like waybar background etc.
* Add QT theme
* Add ARCH update checker
* force_default_wallpaper = 0
* Nemo
    * Fix `Open with vim`
    * Add opacity to for example `select file` popups in imgur etc.
* Logitech Master MX 3s
    * Configure keybinds
* Powermenu
    * Add umountall before shutting down
* Create suspend script and use it in hypridle and powermenu
    * Pause all players
    * Mute microphone / unmute after suspend
* Add notifications for laptop shortcut actions
* Checkout flameshot
* Create workspaces for spotify / discord + telegram

# Credits and inspirations
Configuration based and inspired on:
* https://gitlab.com/stephan-raabe/dotfiles
* https://gitlab.com/thelinuxcast/my-dots
* https://github.com/justinmdickey/publicdots/tree/main
* https://github.com/adi1090x/rofi
* https://github.com/zDyanTB/HyprNova