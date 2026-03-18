{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    wasistlos
    telegram-desktop
  ];
}
