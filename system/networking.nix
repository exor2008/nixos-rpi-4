{ config, pkgs, lib, ... }:

let
  interface = "wlan0";
  hostname = "NixOS-RPI4";
in
{
  networking = {
    hostName = hostname;
    wireless = {
      enable = true;
      networks = {
        Bella1611.pskRaw = "ext:password";
      };
      interfaces = [ interface ];
      secretsFile = "/etc/nixos/secrets/wifi.conf";
    };
  };
  
  services = {
    vnstat.enable = true;
    openssh.enable = true;
  };
}
