{ config, pkgs, lib, inputs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
    };
  };
}
