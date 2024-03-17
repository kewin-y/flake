{ ... }:

{
	programs.nixvim.plugins.nvim-tree = {
		enable = true;
		disableNetrw = true;
		hijackNetrw = true;
		hijackCursor = true;
		hijackUnnamedBufferWhenOpening = true;
		syncRootWithCwd = true;

		view = {
			side = "right";
			preserveWindowProportions = true;
		};

		filters = {
			dotfiles = false;
		};

		git = {
			enable = false;
			ignore = true;
		};

		actions = {
			openFile = {
					resizeWindow = true;
					quitOnOpen = true;
			};
		};

		renderer = {
			rootFolderLabel = false;
		};
	};
}
