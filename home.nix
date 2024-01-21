{ pkgs, ... }:

{
  imports = [
    ./programs/hyprland.nix
    ./programs/rofi.nix
    ./programs/nvim.nix
    ./programs/git.nix
    ./programs/bash.nix
    ./programs/zsh.nix
    ./programs/fish.nix
    ./programs/starship.nix
  ];

  home.username = "sprout";
  home.homeDirectory = "/home/sprout";
  home.stateVersion = "23.11"; # Do not change this value without checking release notes.
  home.packages = with pkgs; [
    eww-wayland
    sysstat
    mako
    libnotify
    docker-compose
    swww
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
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
