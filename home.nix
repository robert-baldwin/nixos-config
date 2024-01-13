{ pkgs, ... }:

{
  imports = [
    ./programs/nvim.nix
    ./programs/git.nix
    ./programs/fish.nix
  ];

  home.username = "sprout";
  home.homeDirectory = "/home/sprout";
  home.stateVersion = "23.11"; # Do not change this value without checking release notes.
  home.packages = with pkgs; [
    socat
    ripgrep
    jq
    git
    delta
    wl-clipboard
    floorp
    _1password-gui
  ];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
