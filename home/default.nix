{ ... }:

{
   imports = [ 
    ./nushell.nix
    ./home-manager.nix
    ./git.nix
    ./kitty.nix
    ./xdg.nix
    ./swayidle.nix
    ./swaylock.nix
    ./icons.nix
    ./wlogout
    ./sway
    ./waybar
  ];

  home.stateVersion = "24.05";
}
