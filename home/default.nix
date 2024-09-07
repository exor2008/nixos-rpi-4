{pkgs, ...}:

{
   imports = [ 
    ./nushell.nix
    ./home-manager.nix
    ./git.nix
    ./sway
  ];

  home.stateVersion = "24.05";
}
