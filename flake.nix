{
description = "WebPirat's NixOS Configuration";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
 #nixpkgs.url = "https://github.com/NixOS/nixpkgs/archive/refs/heads/master.zip";
	stylix.url = "github:danth/stylix";
	home-manager = {
	      url = "github:nix-community/home-manager/";
	      inputs.nixpkgs.follows = "nixpkgs";
	};
	nixvim = {
	      url = "github:nix-community/nixvim/";
	      inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = { nixpkgs, home-manager, stylix, ... } @ inputs:
  {
    nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
			  stylix.nixosModules.stylix
        ./core/configuration.nix
        ./core/hardware-configuration.nix
				./theme/stylix.nix
        home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.webpirat = import ./home.nix;
            };
          }
      ];
    };
  };
}
