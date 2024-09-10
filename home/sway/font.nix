{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    config = rec {
      fonts = {
        names = [
          "JetBrainsMono Nerd Font"
        ];
      };
    };
  };
}