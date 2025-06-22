{
  config,
  pkgs,
  lib,
  ...
}:

let
  foreground = "#FFFCF9";
  background = "#0C7384";
  selected = "#CC7361";
  font = "JetBrainsMono Nerd Font";
  font-size = 16;
  rounding = 15;
in
{
  wayland.windowManager.sway = {
    config = {
      menu = "${pkgs.wofi}/bin/wofi --show drun";
    };
  };

  programs.wofi = {
    enable = true;

    settings = {
      allow_markup = true;
      width = 650;
      show = "drun";
      prompt = "Apps";
      normal_window = true;
      layer = "top";
      height = "325px";
      orientation = "vertical";
      halign = "fill";
      line_wrap = "off";
      dynamic_lines = false;
      allow_images = true;
      image_size = 24;
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = true;
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;
      key_expand = "Tab";
      key_exit = "Escape";
    };

    style =
      # css
      ''
        * {
          font-family: "${font}";
          font-weight: 600;
          font-size: ${toString font-size}px;
        }

        #window {
          background-color: ${background};
          color: ${foreground};
          border-radius: ${toString rounding}px;
        }

        #outer-box {
          padding: 20px;
        }

        #input {
          background-color: ${selected};
          border: 0px solid ${background};
          color: ${foreground};
          padding: 8px 12px;
        }

        #scroll {
          margin-top: 20px;
        }

        #inner-box {}

        #img {
          padding-right: 8px;
        }

        #text {
          color: ${foreground};
        }

        #text:selected {
          color: ${foreground};
        }

        #entry {
          padding: 6px;
        }

        #entry:selected {
          background-color: ${selected};
          color: ${foreground};
        }

        #unselected {}

        #selected {}

        #input,
        #entry:selected {
          border-radius: ${toString rounding}px;
        }
      '';
  };
}
