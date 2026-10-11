# MangoWM Dotfiles

My personal Arch Linux dotfiles, centered around **MangoWM** and a customized Wayland desktop workflow.

> **Status:** Work in progress. These files reflect my setup and may need adjustments for different hardware, displays, package versions, or installation choices. There is currently no automated installer.

## Desktop components

- **Window manager:** MangoWM

- **Status bar:** Waybar

- **Launcher:** Rofi

- **Notifications:** SwayNC

- **Logout menu:** wlogout

- **Terminal:** Kitty

- **Shell:** Fish

- **Dynamic theming:** Matugen

- **GTK appearance:** GTK 3 / GTK 4 settings and nwg-look

The repository may also include supporting application settings and scripts. Only the components actually present in this repository should be considered part of the setup.

## Repository layout

```
dotfiles/
├── README.md
├── .gitignore
└── config/
    ├── mango/
    ├── waybar/
    ├── rofi/
    ├── swaync/
    ├── wlogout/
    ├── matugen/
    ├── kitty/
    ├── fish/
    ├── gtk-3.0/
    ├── gtk-4.0/
    └── ...
```

`config/` is an organizational folder in this repository. Its contents are intended to map to matching directories under `~/.config/`.

## Before using these dotfiles

1. Review the configuration files and scripts before running them.

2. Check that the required packages are installed on your system.

3. Back up any existing configuration that you plan to replace.

4. Check paths, monitor settings, startup commands, fonts, icon themes, wallpaper locations, and environment variables. These may be specific to my machine.

5. Do not copy the entire repository into `~/.config`; copy only the configuration directories you intend to use.

## Manual setup

Clone the repository:

```
git clone https://github.com/Nabeel3770/mango-dotfiles.git
cd mango-dotfiles
```

Replace `YOUR_USERNAME/YOUR_REPO` with the actual GitHub repository path.

For example, to install the MangoWM and Waybar configuration, first back up any existing directories, then copy the selected folders:

```
mkdir -p ~/.config-backup
[ ! -e ~/.config/mango ] || cp -a ~/.config/mango ~/.config-backup/mango
[ ! -e ~/.config/waybar ] || cp -a ~/.config/waybar ~/.config-backup/waybar

cp -a config/mango ~/.config/
cp -a config/waybar ~/.config/
```

Repeat for other components only when you want to use them. Copying directories into an existing configuration can merge files, so inspect the result and remove obsolete settings manually if needed.

Restart or reload the relevant applications after copying the configurations. If you are currently using another window manager, do not replace its configuration until you have checked the login/session and recovery path.

## Wallpaper and dynamic theming

This setup may use a wallpaper workflow involving `awww`, Matugen, Waybar, Kitty, SwayNC, and MangoWM configuration reloads. Check the scripts and Matugen templates in the repository for the exact commands and dependencies.

Before using a wallpaper or theme script, verify that any hard-coded paths match your system. In particular, replace machine-specific wallpaper paths with your own wallpaper directory.

## Updating

After cloning, update the local copy with:

```
cd mango-dotfiles
git pull
```

Review changes before copying updated configurations into `~/.config`, especially if you have made local edits.

## Contributing / reuse

Feel free to explore the configuration and adapt it to your own setup. If you redistribute substantial parts of this repository, check the license and the licenses of any included wallpapers, fonts, themes, scripts, or other third-party assets.

## TODO

- [ ] Verify and document package dependencies

- [ ] Document keybindings

- [ ] Document wallpaper and Matugen workflow

- [ ] Remove machine-specific paths and unused files

- [ ] Add screenshots of the desktop

- [ ] Test the setup on a clean Arch Linux user account or virtual machine

- [ ] Consider a backup-aware installer after the manual setup is stable

