{ inputs, pkgs, lib, ... }:

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/var/lib/test";
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
	    FabricAPI = pkgs.fetchurl { 
	      url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/3WOjLgFJ/fabric-api-0.116.1%2B1.21.4.jar"; 
              sha512 = "sha512-7MWdpRFJJQKEsHUkdcezKOCwMliIlIORWXr8Y41uZ/pDYpevEtIGc3beAJj/psqGqjuNYBE1bBeSIkBMcBxjRQ"; 
	    };
 	    ClothConfigAPI = pkgs.fetchurl { 
	      url = "https://cdn.modrinth.com/data/9s6osm5g/versions/TJ6o2sr4/cloth-config-17.0.144-fabric.jar"; 
              sha512 = "sha512-7MWdpRFJJQKEsHUkdcezKOCwMliIlIORWXr8Y41uZ/pDYpevEtIGc3beAJj/psqGqjuNYBE1bBeSIkBMcBxjRQ"; 
	    }; 
	    FerriteCore = pkgs.fetchurl { 
	      url = "https://cdn.modrinth.com/data/uXXizFIs/versions/IPM0JlHd/ferritecore-7.1.1-fabric.jar"; 
	      sha512 = "sha512-9B3J6LKDJ6HimxRmfLQq5efhe8+kSVJg9vhRqA1LCNmKMNXFKxEAB+4yXwLax0MeP61FYMaECvC/NHr61IxarA"; 
 	    };
	    Lithium = pkgs.fetchurl { 
	      url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/3WOjLgFJ/fabric-api-0.116.1%2B1.21.4.jar"; 
	      sha512 = "sha512-OJrmHb9r1M2dFqaOKri3Sg5G5jAZcK017B/q7U4SO8WinLNuftfIqifFo/5e39OXWSAkDylmep9JyZR/W6kR5w"; 
 	    };

	    Terralith = pkgs.fetchurl { 
	      url = "https://cdn.modrinth.com/data/8oi3bsk5/versions/MuJMtPGQ/Terralith_1.21.x_v2.5.8.jar"; 
              sha512 = "sha512-+GLtVDXOTBGpfS6lxA7un4F8kI8yI7X9Pj//BWKlURHXQp3HOi8coLGvex/2+gRw7W7+u13hMzbEC7cPs1fdYA"; 
	    };
	    Appleskin = pkgs.fetchurl { 
	      url = "https://cdn.modrinth.com/data/EsAfCjCV/versions/cHQjeYVS/appleskin-fabric-mc1.21.3-3.0.6.jar"; 
              sha512 = "sha512-tXKj7qQ+AISBnIjdf6xqCl1VVdm3PfknuX8pdk8oHK2/yMxfj2tpIPFne87Ie0EeWlgtMFoZFzWtjWD8kJAJAA"; 
	    };
   
	  });
	};
      };
    };
  };
}
