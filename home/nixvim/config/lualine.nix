{config, ...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      theme = "base16";
      options = {
        icons_enabled = false;
        global_status = true;
        component_separators = {
          left = "";
          right = " ";
        };
        section_separators = {
          left = "";
          right = "";
        };
        theme = with config.lib.stylix.colors;  {
          normal = {
            a = {bg = "nil"; fg = "#${base0D}";};
            b = {bg = "nil";};
            c = {bg = "nil";};
            z = {bg = "nil";};
            y = {bg = "nil";};
          };
          insert = {
            a = {bg = "nil"; fg = "#${base0E}";};
            b = {bg = "nil";};
            c = {bg = "nil";};
            z = {bg = "nil";};
            y = {bg = "nil";};
          };
          command = {
            a = {bg = "nil"; fg = "#${base08}";};
            b = {bg = "nil";};
            c = {bg = "nil";};
            z = {bg = "nil";};
            y = {bg = "nil";};
          };
          visual = {
            a = {bg = "nil"; fg = "#${base0B}";};
            b = {bg = "nil";};
            c = {bg = "nil";};
            z = {bg = "nil";};
            y = {bg = "nil";};
          };
          replace = {
            a = {bg = "nil"; fg = "#${base0A}";};
            b = {bg = "nil";};
            c = {bg = "nil";};
            z = {bg = "nil";};
            y = {bg = "nil";};
          };
        };
      };
      sections = {
        lualine_a = ["mode"];
        lualine_b = ["filename"];
        lualine_c = [
          "branch"
          "diff"
        ];
        lualine_x = ["diagnostics"];
        lualine_y = ["progress"];
        lualine_z = ["location"];
      };
    };
  };
}
