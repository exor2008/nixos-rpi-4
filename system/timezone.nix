{ config, pkgs, lib, ... }:

{
  services.automatic-timezoned.enable = true;
  time.timeZone = "US/Eastern";
}