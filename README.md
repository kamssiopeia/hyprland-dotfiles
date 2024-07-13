# Screenshots
### Preview
![](screenshots/main.jpg)

### App launcher
![](screenshots/launcher.jpg)

### Wallpaper picker
![](screenshots/wallpaper_picker.jpg)

# Dependencies
### Hyprland
```
hyprland hyprpaper hyprlock hypridle xdg-desktop-portal xdg-desktop-portal-hyprland waybar rofi-lbonn-wayland swaync pipewire pavucontrol grim slurp brightnessctl pamixer
```

### Network
```
network-manager network-manager-applet dnsutils dnsmasq
```

### Theme
```
papirus-icon-theme nerd-fonts breeze breeze-gtk nwg-look dracula
```

### Pywal theming
```
pywal-16-colors walogram-git
```

### Apps
```
kitty nemo nemo-fileroller keepassxc code gnome-font-viewer yazi
```

### Programming
```
docker docker-compose postman git gitflow-avh nvm jdk11-openjdk jdk21-openjdk
```

### Bluetooth
```
bluez bluez-utils
```

### Peripherals
```
solaar
```

### Dotfiles management
```
stow
```


# Migrating to new machine
Dotfiles management is done using [GNU stow](https://www.gnu.org/software/stow/). For more information watch [dotfiles management with GNU stow view](https://www.youtube.com/watch?v=y6XCebnB9gs).

### Requirements
Make sure that following dependencies are installed on your system
```
pacman -S git stow
```

### Installation
First, clone repo to `$HOME` directory using git, then `cd` into it

```
git clone ...
cd dotfiles
```

then use GNU stow to create symlinks
```
stow .
```

if there are any files conflicting with this repo use following command. Beware that doing it will overwrite files in this repo with corresponding local ones
```
stow --adopt .
```


# TODO
* Hyprland config
    * Cleanup hyprland config
    * Split config into files
    * Add monitor profiles 3 monitors / single monitor
* Notifications
    * Configure notifications to show only on main screen
    * Notifications for laptop shortcut actions
* Add media center
* Virtual desktopesque workspaces - https://github.com/levnikmyskin/hyprland-virtual-desktops
* Add QT theme
* Add ARCH update checker
* Logitech Master MX 3s
    * Configure keybinds
* Powermenu
    * Add umountall before shutting down
* Create suspend script and use it in hypridle and powermenu
    * Pause all players
    * Mute microphone / unmute after suspend
* Checkout flameshot
* Create workspaces for spotify / discord + telegram
* Pywal
    * Change colors in nemo (GTK)
    * Figure out inactive border color, change active border colors to be clearly visible (Hyprland)
    * Improve vscode colors (some text is very hard to read)
* Rofi theme switcher
    * Stylize theme switcher - simple list with search bar
    * Add apply current wallpaper theme entry
* Rofi window / workspace switcher
    * Try to make it work like windows / kde alt + tab (holding alt to display etc.)
    * Try to implement secondary switcher for windows of current window type (if chrome is active, cycle between chrome instances etc.)
    * It should cycle like windows alt + tab, so recent windows should be at the top
* Hyprpaper
    * Make it use current wallpaper and current theme colors
