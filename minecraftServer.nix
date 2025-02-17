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
	  mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
	    Lithium = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/3WOjLgFJ/fabric-api-0.116.1%2B1.21.4.jar"; sha512 = "e5f3c3431b96b281300dd118ee523379ff6a774c0e864eab8d159af32e5425c915f8664b1"; };
	  });
	};
      };
    };
  };
}
