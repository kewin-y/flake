{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      inter
      pkgs.nerd-fonts.fira-code
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      liberation_ttf
      dejavu_fonts
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
          "FiraCode Nerd Font Propo"
          "Noto Sans Mono CJK"
          "Noto Color Emoji"
        ];
      };
    };
  };
}
