{ config, pkgs, lib, ... }:

{
  programs = {
    git = {
      enable = true;
      userEmail = "exorsteam2008@gmail.com";
      userName = "exor2008";
    };
  };
}