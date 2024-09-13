{ wallpapers, ... }:

{
  wayland.windowManager.sway = {
    config = {
      output = {
        HDMI-A-1 = {
          mode = "1920x1080@60Hz bg ${wallpapers}/wallpaper.png stretch";
        };
      };
    };
  };
}
