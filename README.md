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

The `hosts` directory contains shared system configuration in `configuration.nix` and shared user configuration in `home.nix` for `desktop` and `laptop` hosts.

Each host (desktop, laptop, etc.) has its own directory and `default.nix` file specifying system configuration specific to the host. The user configuration `home.nix` is the same across all hosts.

The `modules` directory configurations for installed programs like `hyprland`, `eww`, `git`, and `neovim` and is referenced by `home.nix`.

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

# Learn more
Check out the [Nix manual](https://nixos.org/manual/nixpkgs/unstable/) and [Home Manager manual](https://nix-community.github.io/home-manager/) to learn more about Nix and Home Manager.
Visit [MyNixOS](https://mynixos.com/) to browse available configuration options and packages. To delve deeper into package definitions visit the [nixpkgs Github repository](https://github.com/NixOS/nixpkgs).
