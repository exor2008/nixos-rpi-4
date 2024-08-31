{
  description = "RPI 4 NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/unstable";
    home-manager = {
      url = "github:nix-community/home-manager/unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.NixOS-RPI4 = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.me = import ./home.nix;
            }
      ];

    };
  };
}