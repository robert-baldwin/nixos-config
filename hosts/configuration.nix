{ pkgs, inputs, ... }:

{
  # Configure Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set system state version.
  system.stateVersion = "23.11"; # Do not change. Read `man configuration.nix`

  # Set time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sprout = {
    isNormalUser = true;
    description = "Robert Baldwin";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable git
  programs.git.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable sound with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    curl
    wget
  ];

  # Install fonts
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerdfonts
    google-fonts
    font-awesome
  ];

  # Configure login manager
  services.xserver = {
    displayManager.gdm.enable = true;
    layout = "us";
    xkbVariant = "";
  };

  # Enable bluetooth with blueman
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  # Install Docker virtualization
  virtualisation.docker.enable = true;

  # Enable hyprland compositor
  xdg.portal = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.xdg-desktop-portal-hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland;
  };

  # Configure user
  users.users.sprout = {
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };
  programs.fish.enable = true;


  # Flake support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
