# https://nixos-and-flakes.thiscute.world/development/intro
{
  description = "Node.js development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self , nixpkgs ,... }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
        inherit system;
    };
  in {
    devShells."${system}".default = pkgs.mkShell {
      packages = with pkgs; [
        nodejs_23
        nodePackages.pnpm
      ];
      shellHook = ''
        echo "node `${pkgs.nodejs}/bin/node --version`"
      '';
    };
  };
}
