Personal flake for NixOS desktop and laptop.

# Overview
Built with Nix and Home Manager. Contains configuration for multiple machines.

Organization inspired by [4tm4n/nixos-config](https://gitlab.com/4tm4n/nixos-config).
```
.
├── flake.lock
├── flake.nix
├── hosts
│   ├── desktop
│   ├── laptop
│   ├── configuration.nix
│   └── home.nix
├── modules
│   ├── desktop
│   │   ├── eww
│   │   ├── eww.nix
│   │   ├── hyprland.nix
│   │   └── wallpapers
│   └── programs
└── README.md
```

At the top level, `flake.nix` defines sources and `flake.lock` records the versions used.

The `hosts` directory shared system configuration in `configuration.nix` and shared user configuration `home.nix` for `desktop` and `laptop` hosts.

Each host (desktop, laptop, etc.) has its own directory and `default.nix` file specifying system configuration specific to the host. The user configuration is the same across all hosts.

The `modules` directory configurations for installed programs like `hyprland`, `eww`, `git`, and `neovim` among others.

# Updating
## Sources
To update the flake sources:
```
nix flake update
```

This will fetch new versions and update `flake.lock`.

## System
To rebuild the system:
```
sudo nixos-rebuild switch --flake path/to/nixos-config#<host>
```
Where `<host>` is either `desktop` or `laptop`.

## User
To rebuild the user space:
```
home-manager switch --flake path/to/nixos-config
```
