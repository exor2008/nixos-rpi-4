
{ config, pkgs, lib, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = ["root" "ian"];

  imports = [ 
    ./cachix.nix
    ./hardware-configuration.nix
    ./system.nix  
  ];

  system.stateVersion = "24.11";
}
