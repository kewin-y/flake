{...}: {
  programs = {
    git = {
      enable = true;
      config = {
        user = {
          name = "Kevin";
          email = "jekevin964@gmail.com";
        };
        init = {
          defaultBranch = "main";
        };
      };
    };

    lazygit = {
      enable = true;
    };
  };
}
