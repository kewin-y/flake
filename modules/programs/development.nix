{
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.nix-ld.enable = true;

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  # For stuff I'm too lazy to make a devshell for every time
  # Coding agents need LSPs so I'll keep these here
  environment.systemPackages =
    lib.attrValues {
      inherit
        (pkgs)
        typst
        nodejs
        pnpm
        prettierd
        typescript-language-server
        typescript-go
        tailwindcss-language-server
        bun
        valgrind-light
        clang-tools
        cmake
        code-cursor
        vscode
        opencode
        ty
        ruff
        nh
        ;
    }
    ++ [inputs.codex-cli-nix.packages.${pkgs.stdenv.hostPlatform.system}.default];

  nix.settings = {
    substituters = ["https://codex-cli.cachix.org"];
    trusted-public-keys = ["codex-cli.cachix.org-1:1Br3H1hHoRYG22n//cGKJOk3cQXgYobUel6O8DgSing="];
  };
}
