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
        rev = "v1.5.0";
        sha256 = "sha256-27998q9wbaNP1xYY+KHTBeJRfR6Q/K0LNdbRb3YHC6c=";
      };
      pnpmDeps = old.pnpmDeps.overrideAttrs (old': {
        inherit src;
        inherit (old') version patches ELECTRON_SKIP_BINARY_DOWNLOAD;
        outputHashAlgo = "sha256";
        outputHash = "sha256-cnk+KFdvsgG1wGDib7zgIS6/RkrR5EYAHtHcrFSU0Es=";
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
