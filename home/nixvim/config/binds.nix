{ ... }:

{
	programs.nixvim = {
		globals.mapleader = " ";
		keymaps = [
			{
				mode = "n";
				key = "<leader>w";
				action = "<cmd>NvimTreeToggle<CR>";
			}

      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>noh<Cr>";
      }

      # Window left
      { 
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
      }

      # Window right
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
      }

      # Window down
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
      }

      # Window Up
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
      }

      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
      }
        
      # Move up
      {
        mode = [ "n" "v" ];
        key = "k";
        action = ''v:count || mode(1)[0:1] == "no" ? "k" : "gk"'';
        options = {
          expr = true;
        };
      }

      # Move down
      {
        mode = [ "n" "v" ];
        key = "j";
        action = ''v:count || mode(1)[0:1] == "no" ? "j" : "gj"'';
        options = {
          expr = true;
        };
      }

      {
        mode = [ "n" "v" ];
        key = "<leader>y";
        action = ''[["+y"]]'';
      }

      {
        mode = "n";
        key = "<leader>Y";
        action = ''[["+Y"]]'';
      }

      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
      }

      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
      }

      {
        mode = "v";
        key = "<";
        action = "<gv";
      }

      {
        mode = "v";
        key = ">";
        action = ">gv";
      }
		];
	};
}
