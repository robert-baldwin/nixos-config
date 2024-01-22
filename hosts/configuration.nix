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

  # Flake support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
