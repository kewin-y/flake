{base, ...}: {
  programs = {
    git = {
      enable = true;
      config = {
        user = {
          name = base.user;
          email = base.email;
        };
        init = {
          defaultBranch = "main";
        };
        pull.rebase = false; # merge
      };
    };
  };
}
