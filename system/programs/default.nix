{ config, pkgs, lib, ... }:

{
 imports = [ 
    ./nixvim.nix
    ./polkit.nix
    ./git.nix
    ./neofetch.nix
  ];
}