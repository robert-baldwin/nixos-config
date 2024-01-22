{ config, pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
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
}
