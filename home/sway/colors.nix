{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    config = {
      colors = {
        background = "#152528";
        focused = {
          background = "#293E40";
          border = "#FF8349";
          childBorder = "#FF8349";
          text = "#E6EAEA";
          indicator = "#FF8349";
        };
        focusedInactive = {
          background = "#293E40";
          border = "#5A93AA";
          childBorder = "#5A93AA";
          text = "#E6EAEA";
          indicator = "#5A93AA";
        };
        placeholder = {
          background = "#293E40";
          border = "#FF8349";
          childBorder = "#FF8349";
          text = "#E6EAEA";
          indicator = "#FF8349";
        };
        unfocused = {
          background = "#152528";
          border = "#2D4F56";
          childBorder = "#2D4F56";
          text = "#E6EAEA";
          indicator = "#2D4F56";
        };
      };
    };
  };
}