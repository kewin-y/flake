{
  pkgs,
  lib,
  inputs,
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
    or-pkgs = inputs.openresearch.packages.${pkgs.stdenv.hostPlatform.system};
    openresearch = or-pkgs.openresearch;
    orx = or-pkgs.orx;

    pythonPackages = pythonPkgs: lib.attrValues {
      inherit
        (pythonPkgs)
        fastapi
        ;
    };
    pythonEnv = pkgs.python3.withPackages pythonPackages;
  in
    lib.attrValues {
      inherit openresearch orx;
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
        ;
    }
    ++ [pythonEnv];
}
