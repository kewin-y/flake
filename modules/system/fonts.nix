{pkgs, ...}: {
  fonts = {
    packages = [
      pkgs.maple-mono.NF
      pkgs.maple-mono.CN
      pkgs.nerd-fonts.lilex
      pkgs.inter
      pkgs.noto-fonts-cjk-sans
      pkgs.noto-fonts-cjk-serif
      pkgs.noto-fonts-color-emoji
      pkgs.liberation_ttf
      pkgs.dejavu_fonts
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [
          "Inter"
          "Noto Sans CJK"
          "Noto Color Emoji"
        ];
        serif = [
          "DejaVu Serif"
          "Noto Serif CJK"
          "Noto Color Emoji"
        ];
        monospace = [
          "Maple Mono NF"
          "Maple Mono CN"
          "Noto Color Emoji"
        ];
      };
    };
  };
}
