{ pkgs, ... }:

let 
  wallpaper = pkgs.fetchFromGitHub {
    owner = "exor2008";
    repo = "stardog";
    rev = "aaadabd57aaa29266db1fe19432441f1df989641";
    hash = "sha256-4rCHN2PIjpX9OoVKtfJNrzL7GDk42K226KvJ9oDh5Wg=";
  }; 
in 
{
  wayland.windowManager.sway = {
    config = {
      output = {
        HDMI-A-1 = {
          mode = "1920x1080@60Hz bg ${wallpaper}/wallpaper.png stretch";
        };
      };
    };
  };
}
