{ config, pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users.ian = {
      isNormalUser = true;
      shell = pkgs.nushell;
      hashedPasswordFile = config.age.secrets.passwd.path;
      extraGroups = [
        "wheel"
        "render"
        "video"
        "plugdev"
      ];
    };
    groups = {
      admins = {
        members = [
          "root"
          "ian"
        ];
      };
    };
  };
}
