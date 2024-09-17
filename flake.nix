{
  description = "raspberry-pi-nix example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:redyf/Neve";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:exor2008/stardog";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, nixos-hardware, home-manager, nixvim, rust-overlay, wallpapers }:
    let
      inherit (nixpkgs.lib) nixosSystem;
    in {
      nixosConfigurations = {
        NixOS-RPI4 = nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit self inputs; };
          modules = [ 
            ./cachix.nix

            ./configuration.nix

            nixos-hardware.nixosModules.raspberry-pi-4

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ian = import ./home;
              home-manager.extraSpecialArgs = {
                inherit self wallpapers;
              };
            }

            ({ pkgs, ... }: {
              nixpkgs.overlays = [ rust-overlay.overlays.default ];
              environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
            })
          ];
        };
      };
    };
}
