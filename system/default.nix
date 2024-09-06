{ config, pkgs, lib, ... }:

{
 imports = [ 
    ./boot.nix
    ./file-system.nix
    ./networking.nix
    ./rpi-hardware.nix
    ./timezone.nix
    ./users.nix
    ./programs
  ];
}