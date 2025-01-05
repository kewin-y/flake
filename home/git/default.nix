{...}: {
  programs = {
    git = {
      enable = true;
      userName = "Kevin";
      userEmail = "jekevin964@gmail.com";
      extraConfig = {
        init = {
          defaulBranch = "main";
        };
      };
    };

    lazygit = {
      enable = true;
    };
  };
}
