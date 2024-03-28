{pkgs, ...}: {
  home.packages = with pkgs; [
    mksh
    fd
  ];

  programs.fzf.enable = true;
  programs.eza.enable= true;

  home.file.".mkshrc".source = ./.mkshrc;
}
