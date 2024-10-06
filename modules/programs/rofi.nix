{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;    
    theme = "DarkBlue.rasi";
    font = "Fira Sans 11";
    terminal = "ghostty";
  };
}
