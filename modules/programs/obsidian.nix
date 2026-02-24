{pkgs, ...}: {
    environment.systemPackages = [
        (pkgs.obsidian.override {
            commandLineArgs = builtins.concatStringsSep " " [
                ''--add-flags "--enable-features=UseOzonePlatform,Vulkan"''
                ''--add-flags "--ozone-platform=x11"''
                ''--add-flags "--use-angle=vulkan"''
                ''--add-flags "--enable-gpu-rasterization"''
            ];
        })
    ];
}
