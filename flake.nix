{
  description = "This flake manages minecraft servers";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      minecraft = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
