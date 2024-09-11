{ config, pkgs, lib, ... }:

let 
  wallpaper = pkgs.fetchFromGitHub {
    owner = "exor2008";
    repo = "stardog";
    rev = "d87fdf10644c2f575910f238c9ce657c53bcd051";
    hash = "sha256-nW9VagxLZhlQDTO/hikvLl6uby9O/7GefxDikrVV3E8=";
  }; 
in 
{
  programs = {
    swaylock = {
      enable = true;
      settings = {
        image = "${wallpaper}/lock.png";
        show-keyboard-layout = true;
        indicator-caps-lock = true;
      };
    };
  };
}