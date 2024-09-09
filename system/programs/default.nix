{ pkgs, lib, ... }:

{
 imports = [ 
    ./nixvim
    ./polkit.nix
    ./git.nix
    ./neofetch.nix
    ./greetd.nix
    ./lf.nix
    ./mc.nix
    ./nnn.nix
    ./pipewire.nix
    ./misc.nix
  ];
}