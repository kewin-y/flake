{inputs, ...}: {
  perSystem = { pkgs, ...}: {
    devShells.default = pkgs.mkShell {
                packages = with pkgs; [
            nixd
            alejandra
          ];

    };
  };
}
