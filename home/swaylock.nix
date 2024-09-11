{ config, pkgs, lib, ... }:

let 
  wallpaper = pkgs.fetchFromGitHub {
    owner = "exor2008";
    repo = "stardog";
    rev = "aaadabd57aaa29266db1fe19432441f1df989641";
    hash = "sha256-4rCHN2PIjpX9OoVKtfJNrzL7GDk42K226KvJ9oDh5Wg=";
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