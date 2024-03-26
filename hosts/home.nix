{ pkgs, ... }:

{
  imports = [
    ../modules/desktop/hyprland.nix
    ../modules/desktop/eww.nix
    ../modules/programs/rofi.nix
    ../modules/programs/nvim.nix
    ../modules/programs/git.nix
    ../modules/programs/bash.nix
    ../modules/programs/zsh.nix
    ../modules/programs/fish.nix
    ../modules/programs/starship.nix
  ];

  home.username = "sprout";
  home.homeDirectory = "/home/sprout";
  home.stateVersion = "23.11"; # Do not change this value without checking release notes.
  home.packages = with pkgs; [
    sysstat
    mako
    libnotify
    docker-compose
    swww
    kitty
    spotify
    vesktop
    socat
    playerctl
    ripgrep
    jq
    git
    delta
    wl-clipboard
    floorp
    _1password-gui
    libreoffice
    obsidian
    zoom-us
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
