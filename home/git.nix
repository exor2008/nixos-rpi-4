{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs = {
    git = {
      enable = true;
      settings.user.mail = "exorsteam2008@gmail.com";
      settings.user.name = "exor2008";
    };
  };
}

