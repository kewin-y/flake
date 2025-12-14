{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation {
        pname = "sf-mono-liga-bin";
        version = "dev";
        src = inputs.sf-mono-liga-src;
        dontConfigure = true;
        installPhase = ''
          mkdir -p $out/share/fonts/opentype
          cp -R $src/*.otf $out/share/fonts/opentype/
        '';
      };
    })
  ];
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      liberation_ttf
      dejavu_fonts
      rubik
      inter
      pkgs.nerd-fonts.roboto-mono
      pkgs.nerd-fonts.iosevka
      font-awesome
      material-icons
      sf-mono-liga-bin
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
          "Liga SFMono Nerd Font"
          "Noto Sans Mono CJK"
          "Noto Color Emoji"
        ];
      };
    };
  };
}
