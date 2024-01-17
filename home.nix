{ pkgs, ... }:

{
  imports = [
    ./programs/hyprland.nix
    ./programs/rofi.nix
    ./programs/nvim.nix
    ./programs/git.nix
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
    (pkgs.vesktop.overrideAttrs (old: rec {
      src = pkgs.fetchFromGitHub {
        owner = "Vencord";
        repo = "Vesktop";
        rev = "2f35128acfb567ab69d6feae7168b63c41c780eb";
        sha256 = "sha256-W01wiTJjnaIq6TjYOMzTNywT8Ti6rFxpGyFszoWOnvQ=";
      };
      pnpmDeps = old.pnpmDeps.overrideAttrs (old': {
        inherit src;
        inherit (old') version patches ELECTRON_SKIP_BINARY_DOWNLOAD;
        outputHashAlgo = "sha256";
        outputHash = "sha256-7Lk/4sv2LnX8vNH3womx4kwR9p67XXtk8rGeuiKTzFQ=";
      });
    }))
    socat
    playerctl
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
