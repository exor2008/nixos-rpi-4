{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kanagawa-icon-theme
  ];
}
