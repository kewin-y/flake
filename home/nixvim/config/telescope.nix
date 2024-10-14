{pkgs, ...}: {
  programs.nixvim.plugins = {
    web-devicons.enable = false;
    telescope = {
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
        prompt_prefix = ">  ";
        selection_caret = "  ";
        entry_prefix = "  ";
        initial_mode = "insert";
        selection_strategy = "reset";
        sorting_strategy = "ascending";
        border = {};
        layout_strategy = "flex";
        layout_config = {
          horizontal = {
            prompt_position = "top";
            preview_width = 0.55;
          };
        };
      };
    };
  };
}
