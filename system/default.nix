{ config, pkgs, lib, ... }:

{
 imports = [ 
    ./boot.nix
    ./file-system.nix
    ./networking.nix
    ./rpi-hardware.nix
    ./rpi-firmware.nix
    ./timezone.nix
    ./users.nix
    ./variables.nix
    ./font.nix
    ./programs
  ];
}