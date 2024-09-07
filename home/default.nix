{pkgs, ...}:

{
   imports = [ 
    ./nushell.nix
    ./home-manager.nix
    ./git.nix
    ./kitty.nix
    ./xdg.nix
    ./sway
  ];

  home.stateVersion = "24.05";
}
