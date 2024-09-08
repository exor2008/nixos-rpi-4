{ config, pkgs, lib, ... }:

{
 imports = [ 
    ./nixvim.nix
    ./polkit.nix
    ./git.nix
    ./neofetch.nix
    ./greetd.nix
    ./lf.nix
    ./mc.nix
    ./nnn.nix
    ./htop.nix
    ./pipewire.nix
  ];
}