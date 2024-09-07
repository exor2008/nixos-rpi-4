{ config, pkgs, lib, ... }:

{
  security = {
    polkit.enable = true;
    pam.services.swaylock = { };
  };
}