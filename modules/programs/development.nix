{
  pkgs,
  lib,
  ...
}: let
in {
  # programs.nix-ld.enable = true;
  # nix-ld is managed in python.nix

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  environment.systemPackages = let
    pythonPackages = pythonPkgs:
      lib.attrValues {
        inherit
          (pythonPkgs)
          fastapi
          ;
      };
    pythonEnv = pkgs.python3.withPackages pythonPackages;
  in
    lib.attrValues {
      inherit
        (pkgs)
        typst
        nodejs
        pnpm
        prettierd
        typescript-language-server
        typescript
        tailwindcss-language-server
        bun
        nh
        tinymist
        typstyle
        picocom
        psmisc
        gh
        ty
        ruff
        # GUYS I'M SORRY
        codex
        claude-code
        t3code
        opencode
        pi-coding-agent
        vscode
        ;
    }
    ++ [pythonEnv];
}
