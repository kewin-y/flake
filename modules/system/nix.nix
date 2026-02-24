# Funny file name lol
{...}: {
    nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
    };

    nix.settings = {
        experimental-features = ["nix-command" "flakes"];
    };
}
