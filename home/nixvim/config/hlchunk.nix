{ pkgs, inputs, ... }:
{
	programs.nixvim = {
		extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
    name = "my-plugin";
    src = pkgs.fetchFromGitHub {
        owner = "shellRaining";
        repo = "882d1bc86d459fa8884398223c841fd09ea61b6bl";
        rev = "<commit hash>";
        hash = "sha256-fvFvV7KAOo7xtOCjhGS5bDUzwd10DndAKs3++dunED8=";
    };
		})];
		extraConfigLua = ''
			require("hlchunk").setup({
				blank ={
					enable = false,
				}
			})
		'';
	};
}
