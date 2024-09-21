{...}: {
  programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };
      new_notes_location = "current_dir";
      templates.subdir = "templates";
      workspaces = [
        {
          name = "work";
          path = "~/Documents/kevin-notes";
        }
        {
          name = "notes";
          path = "~/Documents/notes";
        }
      ];
    };
  };
}
