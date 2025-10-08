{
  description = "Root flake for all NixOS Systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        surfy = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./common.nix
            ./hosts/surfy.nix
          ];
        };

        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./common.nix
            ./hosts/wsl.nix
            nixos-wsl.nixosModules.wsl
          ];
        };
      };
    };
}
