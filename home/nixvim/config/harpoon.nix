{...}: {
  programs.nixvim = {
    plugins.harpoon.enable = true;
    # Since specifying keymaps doesn't work for some reason
    keymaps = [
      {
        mode = "n";
        key = "<leader>a";
        action = ''<cmd>lua require("harpoon.mark").add_file() <Cr>'';
      }

      {
        mode = "n";
        key = "<leader>m";
        action = ''<cmd>lua require("harpoon.ui").toggle_quick_menu() <Cr>'';
      }
    ];
  };
}
