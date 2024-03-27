{...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    globalstatus = true;
    iconsEnabled = false;
    theme = "base16";
    componentSeparators = {
      left = "";
      right = " ";
    };
    sectionSeparators = {
      left = "";
      right = "";
    };
    sections = {
      lualine_a = ["mode"];
      lualine_b = [
        {
          name = "branch";
        }

        {
          name = "diff";
        }

        {
          name = "diagnostics";
        }
      ];
      lualine_c = ["filename"];
      lualine_x = ["filetype"];
      lualine_y = ["progress"];
      lualine_z = ["location"];
    };
  };
}
