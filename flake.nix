{
  description = "RPI 4 NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    raspberry-pi-nix = {
      url = "github:nix-community/raspberry-pi-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    }
  };

  outputs = { nixpkgs, home-manager, raspberry-pi-nix, ... }: {
    nixosConfigurations.nixos-rpi4 = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./configuration.nix
        raspberry-pi-nix.nixosModules.raspberry-pi {
          raspberry-pi-nix.board = "bcm2711";
        }
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.me = import ./home.nix;
        }
      ];
    };
  };
}
