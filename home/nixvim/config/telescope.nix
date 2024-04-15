{pkgs, ...}: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<C-p>" = "git_files";
      "<leader>fw" = "live_grep";
      "<leader>ff" = "find_files";
      "<leader>fo" = "oldfiles";
      "<leader>fb" = "buffers";
    };

    # https://github.com/hmajid2301/dotfiles/blob/ef9de22edb2dd0716e8955197b3050d2f6c97896/home-manager/editors/nvim/plugins/editor/telescope.nix#L5
    settings.defaults = {
      vimgrep_arguments = [
        "${pkgs.ripgrep}/bin/rg"
        "-L"
        "--color=never"
        "--no-heading"
        "--with-filename"
        "--line-number"
        "--column"
        "--smart-case"
        "--fixed-strings"
      ];
      file_ignore_patterns = [
        "^node_modules/"
        "^.devenv/"
        "^.direnv/"
        "^.git/"
      ];
      prompt_prefix = "   ";
      selection_caret = "  ";
      entry_prefix = "  ";
      color_devicons = true;
      initial_mode = "insert";
      selection_strategy = "reset";
      sorting_strategy = "ascending";
      borderchars = [
        "─"
        "│"
        "─"
        "│"
        "╭"
        "╮"
        "╯"
        "╰"
      ];
      border = {};
      layout_strategy = "horizontal";
      layout_config = {
        horizontal = {
          prompt_position = "top";
          preview_width = 0.55;
          results_width = 0.8;
        };
        vertical = {
          mirror = false;
        };
        width = 0.87;
        height = 0.80;
        preview_cutoff = 120;
      };
      set_env.COLORTERM = "truecolor";
    };
  };
}
