{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    config = {
      gaps = {
        smartGaps = true;
        smartBorders = "on";
        inner = 10;
      };
    };
  };
}