{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    config = {
      window = {
        border = 3;
        titlebar = false;
        commands = [
          {
            command = "opacity 0.9, border pixel 3";
            criteria = {
              class = ".*";
            };
          }
          {
            command = "opacity 0.9, border pixel 3";
            criteria = {
              app_id = ".*";
            };
          }
        ];
      };
    };
  };
}