{ inputs, pkgs, lib, ... }:
  let
    vanillaPlusServerMods = pkgs.fetchPackwizModpack {
      url = "https://raw.githubusercontent.com/cmacwill1/vanillaPlusServer/refs/heads/main/pack.toml";
      packHash = "";
    };
  in
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/var/lib/minecraft";
    servers = {
      fabric-server = {
	enable = true;
	package = pkgs.fabricServers.fabric-1_21_4.override {
	  loaderVersion = "0.16.10";
	}; 
	serverProperties = {
	  server-port = 25566;
	};
	symlinks = {
          "mods" = "${vanillaPlusServerMods}/mods";
	};
      };
    };
  };
}
