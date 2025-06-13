{ wallpapers, ... }:

{
  wayland.windowManager.sway = {
    config = {
      output = {
        HDMI-A-1 = {
          mode = "1920x1080@60Hz bg ${wallpapers}/wallpaper.png stretch";
          pos = "0 0"; 
        };
        SPI-1 = {
          mode = "480x320 scale 0.7";
          bg = "${wallpapers}/wallpaper_small.png stretch";
          pos = "1920 0";
        };
      };
      
      workspaceOutputAssign = [
        {
          output = "SPI-1";
          workspace = "10";
        }
        {
          output = "HDMI-A-1";
          workspace = "1";
        }
      ];

      defaultWorkspace = "workspace number 1";
    };
  };
}
