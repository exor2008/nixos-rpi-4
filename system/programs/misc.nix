{ config, pkgs, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    htop
    ripgrep
    dust
    wl-clipboard
  ];
}