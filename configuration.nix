{ config, pkgs, lib, ... }:

let
  SSID = "Bella1611";
  SSIDpassword = "Miroslava0831";
  interface = "wlan0";
  hostname = "NixOS-RPI4";
in
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = ["root" "me"];

  imports = [ ./cachix.nix ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking = {
    hostName = hostname;
    wireless = {
      enable = true;
      networks."${SSID}".psk = SSIDpassword;
      interfaces = [ interface ];
    };
  };

  services.openssh.enable = true;

  users = {
    mutableUsers = false;
    users.me = {
      isNormalUser = true;
      shell = pkgs.nushell;
      password = "zaq1";
      extraGroups = [ "wheel" "render" "video" ];
    };
    groups.admins = {
      members = [ "root" "me" ];
    };
  };

  system.stateVersion = "24.11";
}
