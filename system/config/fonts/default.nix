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
          "Noto Color Emoji"
        ];
        serif = [
          "DejaVu Serif"
          "Noto Serif CJK"
          "Noto Color Emoji"
        ];
        monospace = [
          "RobotoMono Nerd Font Propo"
          "Noto Sans Mono CJK"
          "Noto Color Emoji"
        ];
      };
    };
  };
}
