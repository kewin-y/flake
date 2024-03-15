{ pkgs, config, ... }:

{
	programs.nixvim.plugins = {
		treesitter-context.enable = true;
		treesitter = {
			enable = true;
			indent = true;
			nixGrammars = true;
			nixvimInjections = true;
		};
	};
}
