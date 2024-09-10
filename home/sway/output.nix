{ pkgs, ... }:

let 
  wallpaper = pkgs.fetchFromGitHub {
    owner = "exor2008";
    repo = "stardog";
    rev = "d8de1af527100b9962e64a77d6eef8f31b19931c";
    hash = "sha256-mU8SinH+TXJYsxdBrqQY6/Wrf6gjB9oQthVcnpiNx/8=";
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
