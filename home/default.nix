{pkgs, ...}:

{
   imports = [ 
    ./nushell.nix
    ./home-manager.nix
    ./sway
  ];

  home.stateVersion = "24.05";
}
