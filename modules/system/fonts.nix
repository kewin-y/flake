{pkgs, ...}: {
  fonts = {
    packages = [
      pkgs.inter
      pkgs.nerd-fonts.lilex
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
          "Lilex Nerd Font Propo"
          "Noto Sans Mono CJK"
          "Noto Color Emoji"
        ];
      };
    };
  };
}
