{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs_21
    llvmPackages_9.clang-unwrapped
    typescript
  ];

}
