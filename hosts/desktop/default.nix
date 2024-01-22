{ inputs, config, pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
  ];

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

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1"; # Fix to display cursor
    NIXOS_OZONE_WL = "1"; # Use Wayland on Electron apps
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
  };


  # OpenGL support
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa.drivers
    ];
  };

  # Nvidia GPU drivers
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

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
}
