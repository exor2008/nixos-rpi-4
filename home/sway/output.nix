{ wallpapers, ... }:

{
  wayland.windowManager.sway = {
    config = {
      output = {
        HDMI-A-1 = {
          mode = "1920x1080@60Hz bg ${wallpapers}/wallpaper.png stretch";
          pos = "0 0";
        };
      };

      workspaceOutputAssign = [
        {
          output = "HDMI-A-1";
          workspace = "1";
        }
      ];

      defaultWorkspace = "workspace number 1";
    };
  };
}
