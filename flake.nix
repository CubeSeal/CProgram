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
            packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
                pname = "main";
                version = "1.0.0";
                src = self; # The source is the flake itself

                buildInputs = [
                    pkgs.gcc
                    pkgs.gnumake
                ];

                installPhase = ''
                    runHook preInstall
                    mkdir -p $out/bin
                    cp bin/main $out/bin/
                    runHook postInstall
                    '';
            };

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
