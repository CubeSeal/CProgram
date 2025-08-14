{
    description = "C Flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs }:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;

                config = {
                    allowUnfree = true; # Allow unfree packages
                };
            };
        in
        {
            packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

            packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

            devShells.${system}.default = pkgs.mkShell {
                packages = with pkgs; [
                    gcc
                    cmake
                ];

                shellHook = ''
                    set -o vi
                '';
            };

        };
}
