{ config, pkgs, lib, ... }:

{
  users = {
    mutableUsers = false;
    users.ian = {
      isNormalUser = true;
      shell = pkgs.nushell;
      password = "zaq1";
      extraGroups = [ "wheel" "render" "video" ];
    };
    groups.admins = {
      members = [ "root" "ian" ];
    };
  };
}