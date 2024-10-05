{ pkgs, inputs, config, ... }:

{
  imports = [
    ../modules/desktop/hyprland.nix
    ../modules/desktop/waybar.nix
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
    element-desktop-wayland
  ];

  home.pointerCursor =
    let
      getFrom = owner: repo: rev: sha256: folder: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 48;
          package =
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              cp -r ${pkgs.fetchFromGitHub {
                owner = owner;
                repo = repo;
                rev = rev;
                sha256 = sha256;
              }}/${folder} $out/share/icons/${name}
            '';
        };
    in
      getFrom 
        "milkmadedev"
        "oreo-cursors-compiled"
        "main"
        "sha256-7PKf6vjczutFXEGLomeZy6b0SeS0LrdAvoskWg4GwVo="
        "oreo_spark_orange_cursors"
        "Oreo-Orange-Cursors";

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Oreo-Orange-Cursors";
      size = 48;
    };
  };

  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/sprout/.config/sops/age/keys.txt";
    secrets = {
      openai_key = { };
    };
  };

  home.sessionVariables = {
    HYPRCURSOR_THEME = "Oreo-Orange-Cursors";
    HYPRCURSOR_SIZE = 48;
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
