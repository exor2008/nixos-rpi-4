{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    config = {
      bars = [
        {
          command = "${pkgs.waybar}/bin/waybar";
          fonts.names = [ "JetBrainsMono Nerd Font" ];
        }
      ];
    };
  };
}