{ inputs, pkgs, lib, ... }:

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
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
	  "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
	    Lithium = fetchurl { url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/QCuodIia/lithium-fabric-0.14.7%2Bmc1.21.4.jar"; };
	  });
	};
      };
    };
  };
}
