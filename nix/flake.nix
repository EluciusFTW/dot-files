{
  description = "NixOS system configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      surfy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/surfy/configuration.nix ];
      };

      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/vm/configuration.nix ];
      };
    };
  };
}
