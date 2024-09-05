{ config, pkgs, lib, ... }:

let
  SSID = "Bella1611";
  SSIDpassword = "Miroslava0831";
  interface = "wlan0";
  hostname = "NixOS-RPI4";
in
{
  networking = {
    hostName = hostname;
    wireless = {
      enable = true;
      networks."${SSID}".psk = SSIDpassword;
      interfaces = [ interface ];
    };
  };
  
  services.openssh.enable = true;
}