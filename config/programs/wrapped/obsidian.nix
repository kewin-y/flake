{ pkgs }:
pkgs.symlinkJoin {
  name = "obsidian-wrapped";
  paths = [
    pkgs.obsidian
  ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/obsidian \
      --add-flags "--enable-features=UseOzonePlatform,Vulkan" \
      --add-flags "--ozone-platform=x11" \
      --add-flags "--use-angle=vulkan" \
      --add-flags "--enable-gpu-rasterization"
  '';
}

