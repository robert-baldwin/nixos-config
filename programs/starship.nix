{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      package.disabled = true;
      shell = {
        disabled = false;
      };
    };
  };
}
