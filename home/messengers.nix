{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    whatsapp-for-linux
    telegram-desktop
  ];
}
