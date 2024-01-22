{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;    
    theme = "DarkBlue.rasi";
    plugins = with pkgs; [
      rofi-emoji
    ];
  };
}
