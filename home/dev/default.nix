{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unityhub
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.ms-dotnettools.csharp
    ];
  }
}
