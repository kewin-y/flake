{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      liberation_ttf
      dejavu_fonts
      rubik
      pkgs.nerd-fonts.roboto-mono
      font-awesome
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [
          "DejaVu Sans"
          "Noto Sans CJK"
        ];
        serif = [
          "DejaVu Serif"
          "Noto Serif CJK"
        ];
        monospace = [
          "DejaVu Sans Mono"
          "Noto Sans Mono CJK"
        ];
      };
    };
  };
}
