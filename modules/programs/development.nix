{
  pkgs,
  lib,
  inputs,
  ...
}: let
  arduinoIDE = pkgs.symlinkJoin {
    name = "arduino-ide-x11";
    paths = [pkgs.arduino-ide];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/arduino-ide --set ELECTRON_OZONE_PLATFORM_HINT x11
    '';
  };
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
        pi-coding-agent
        codex
        t3code
        opencode
        ;
      arduinoIDE = arduinoIDE;
    }
    ++ [
      inputs.omp.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
