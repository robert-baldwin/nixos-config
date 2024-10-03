{ pkgs, ... }:
{ pkgs, inputs, config, ... }:

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
    ../modules/programs/lazygit.nix
    inputs.sops-nix.homeManagerModules.sops
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
    slack
  ];

  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/sprout/.config/sops/age/keys.txt";
    secrets = {
      openai_key = { };
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
