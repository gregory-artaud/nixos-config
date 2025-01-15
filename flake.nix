{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, zen-browser, home-manager }: {
    nixosConfigurations = {
      kuron = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit inputs; };

	modules = [
	  ./configuration.nix
	  home-manager.nixosModules.home-manager
	  {
        home-manager.backupFileExtension = "backup";
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.gartaud = import ./home.nix;
	    home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
	  }
	];
      };
    };
  };
}
