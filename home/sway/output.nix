{ pkgs, ... }:

let 
  wallpaper = pkgs.fetchFromGitHub {
    owner = "exor2008";
    repo = "stardog";
    rev = "d87fdf10644c2f575910f238c9ce657c53bcd051";
    hash = "sha256-nW9VagxLZhlQDTO/hikvLl6uby9O/7GefxDikrVV3E8=";
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
