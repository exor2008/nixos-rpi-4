{ wallpapers, ... }:

{
  wayland.windowManager.sway = {
    config = {
      output = {
        HDMI-A-1 = {
          mode = "1920x1080@60Hz bg ${wallpapers}/wallpaper.png stretch";
        };
        SPI-1 = {
          mode = "480x320 scale 0.7";
          bg = "${wallpapers}/wallpaper_small.png stretch";
        };
      };
    };
  };
}
