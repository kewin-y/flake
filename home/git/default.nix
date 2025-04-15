{...}: {
  programs = {
    git = {
      enable = true;
      userName = "Kevin";
      userEmail = "jekevin964@gmail.com";
      extraConfig = {
        safe = {
            directory = ["/storage/emulated/0/Documents/notes"];
        };
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
