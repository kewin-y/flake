{
  pkgs,
  lib,
  ...
}: {
  programs.nix-ld = {
    enable = true;
    libraries = lib.attrValues {
      inherit
        (pkgs.stdenv.cc)
        cc
        ;
      inherit
        (pkgs)
        zlib
        zstd
        curl
        openssl
        attr
        libssh
        bzip2
        libxml2
        acl
        libsodium
        util-linux
        xz
        systemd
        ;
    };
  };
  # Usage: to create a venv, just do:
  # $ pythonld -m venv myvenv
  # $ source myvenv/bin/activate
  # $ pip install …
  # https://github.com/nix-community/nix-ld?tab=readme-ov-file#my-pythonnodejsrubyinterpreter-libraries-do-not-find-the-libraries-configured-by-nix-ld
  # Important: don't forget the -a "$0" or venv will skip your wrapper.
  environment.systemPackages = [
    pkgs.python3
    (pkgs.writeShellScriptBin "pythonld" ''
      export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
      exec -a "$0" ${pkgs.python3}/bin/python "$@"
    '')
  ];
}
