{
  description = "raspberry-pi-nix example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager }:
    let
      inherit (nixpkgs.lib) nixosSystem;
    in {
      nixosConfigurations = {
        nixos-rpi4 = nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit inputs; };
          modules = [ 
            ./cachix.nix
  
            ./configuration.nix
  
            nixos-hardware.nixosModules.raspberry-pi-4
  
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.ian = import ./home;
            }
          ];
        };
      };
    };
}