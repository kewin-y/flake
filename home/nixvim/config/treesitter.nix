{ ... }:

{
	programs.nixvim.plugins = {
		treesitter = {
			enable = true;
			indent = true;
			nixGrammars = true;
			nixvimInjections = true;
		};
	};
}
