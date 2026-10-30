{
  pkgs,
  lib,
  inputs,
  ...
}: let
in {
  programs.nix-ld.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  environment.systemPackages = let
    openresearch = inputs.openresearch.packages.${pkgs.stdenv.hostPlatform.system}.openresearch;
    orx = inputs.openresearch.packages.${pkgs.stdenv.hostPlatform.system}.orx;
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
        valgrind-light
        clang-tools
        cmake
        nh
        cargo
        clippy
        rust-analyzer
        rustc
        rustfmt
        tinymist
        typstyle
        picocom
        psmisc
        gh
        ty
        ruff
        codex
        t3code
        opencode
        ;
    }
    ++ [
      inputs.omp.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
