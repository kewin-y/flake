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
        theme = with config.lib.stylix.colors; {
          normal = {
            a = {
              bg = "${base01}";
              fg = "#${base0D}";
            };
            b = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            c = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            z = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            y = {
              bg = "${base01}";
              fg = "#${base04}";
            };
          };
          insert = {
            a = {
              bg = "${base01}";
              fg = "#${base0E}";
            };
            b = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            c = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            z = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            y = {
              bg = "${base01}";
              fg = "#${base04}";
            };
          };
          command = {
            a = {
              bg = "${base01}";
              fg = "#${base08}";
            };
            b = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            c = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            z = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            y = {
              bg = "${base01}";
              fg = "#${base04}";
            };
          };
          visual = {
            a = {
              bg = "${base01}";
              fg = "#${base0B}";
            };
            b = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            c = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            z = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            y = {
              bg = "${base01}";
              fg = "#${base04}";
            };
          };
          replace = {
            a = {
              bg = "${base01}";
              fg = "#${base0A}";
            };
            b = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            c = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            z = {
              bg = "${base01}";
              fg = "#${base04}";
            };
            y = {
              bg = "${base01}";
              fg = "#${base04}";
            };
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
