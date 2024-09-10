{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    config = {
      menu = "${pkgs.wofi}/bin/wofi --show drun";
    };
  };
}