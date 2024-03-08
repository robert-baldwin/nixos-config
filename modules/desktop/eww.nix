{ config, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    package = pkgs.eww;
    configDir = config.lib.file.mkOutOfStoreSymlink ./eww;
  };
}
