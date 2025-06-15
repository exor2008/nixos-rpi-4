{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    settings = {
      theme = builtins.fromTOML ''
       [flavor]
       use = "nightfly"
      '';
    };

    flavors = {
      nightfly = "/home/ian/nightfly";
    };
  };
}
