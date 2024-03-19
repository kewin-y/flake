{...}: {
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        alejandra = {enable = true;};
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
        };
        csharpier = {enable = true;};
        stylua = {enable = true;};
        yamlfmt = {enable = true;};
      };
    };
  };
}
