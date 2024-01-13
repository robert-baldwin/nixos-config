{
  programs.git = {
    enable = true;
    userName = "Robert Baldwin";
    userEmail = "rob.baldwin@hey.com";
    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "nvim";
        pager = "delta";
      };
      interactive.diffFilter = "delta --color-only";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      delta = {
        navigate = true;
        side-by-side = true;
      };
    };
  };
}
