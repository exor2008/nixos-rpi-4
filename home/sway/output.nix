{ pkgs, ... }:

let 
  wallpaper = pkgs.fetchurl {
    url = "https://github.com/exor2008/stardog/blob/main/wallpaper.png"; # replace with the actual image URL
    sha256 = "0h7ax86idilqw87aqxamvlmchr0slnjchimlwmmjxy6hq4jh9yx4"; # Replace with actual hash
  };
in 
{
  wayland.windowManager.sway = {
    config = {
      output = {
        HDMI-A-1 = {
          mode = "1920x1080@60Hz bg ${wallpaper} stretch";
        };
      };
    };
  };
}
