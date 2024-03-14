{ pkgs, config, ... }:

{
	programs.nixvim.plugins.treesitter = {
		enable = true;
		indent = true;
		ensureInstalled = [
			"js"
			"c"
			"cpp"
			"nix"
		];
	};
}
