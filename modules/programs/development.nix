{
  pkgs,
  lib,
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

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  environment.systemPackages = let
    pythonPackages = ps:
      with ps; [
        jupyter
        notebook
        ipykernel
        numpy
        pandas
        matplotlib
        torch
      ];
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
        typescript-go
        tailwindcss-language-server
        bun
        valgrind-light
        clang-tools
        cmake
        ty
        ruff
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

        pi-coding-agent
        codex
        t3code
        opencode
        ;
      arduinoIDE = arduinoIDE;
    }
    ++ [
      pythonEnv
    ];
}
