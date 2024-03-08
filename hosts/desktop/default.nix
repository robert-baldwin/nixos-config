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
    setLdLibraryPath = true;
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

  # Configure OpenSSH
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    extraConfig = ''
      AllowTcpForwarding yes
      PermitOpen localhost:8888
    '';
  };

  users.extraUsers.doug = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqQAlpQPV9l3wFji57+d5FwhwBwXVyDEsyIDpkopGpT2jlo+VdyC3EK8Kt4VrH2HPF9Rb+4MzCe2JSZ/YKxhSO3tVLyehzhqco4YV+jK+1Raz1GIhgM5qkF2T912tIR6g47vQxZjt0H8KjUSndfbvRJlLEP1+HGlWBsjfJ2dBLI54eQ5r3pRTTPa2kZeQ1HQlpQlCVNI8IXspbJExWhoThOlfeEixeJwNIqun+XXc0mmr4olCphLp+xwu1LHFB/q0vcQv+O8xOXMFOqABwrFth81v+cnWjlu8jGD9yB6xdQkNLa1QoKTrfze6+Ty4Gg57P+iCSCQPCBpBC3XYzp0TkFvngT07sd6pDruTtHKehkLjXttgHSFXyhxHYOWT+98CNPjru4OzpNt/qgPGJaR1b+caKCyLD/Aq1M5NqKbitk2AQxZDX5Yb3KGzEstfYbvABUFmCUyb01am++vB7WpMtqL4WyWnp9JPfUZxLHNaTKRSp5ExyEQh9umvQQ+8aEuw7M3yP21DJJcQYaTwfWA50jWWt/Xt464mHQ/zGChCA2/Uo6vii+L3euwZWP/8BdxoD/+0KfNiuBdXK1B44PYhqaDOUVxuVdzB340lA/dLGZ0J5nkmbMWPcUe/ftD4T2Ap4Mo6P7Bmw0fIr2djJ9zzZAOaLB5g+lCWf/DWsp0C+6Q== douglasbaldwin@verizon.net"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMstfSLsVfkM/RIrYabBLtepCF/kuzzMfL/tOuVzDYnF douglasbaldwin@verizon.net"
    ];
  };
}
