{ config, pkgs, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    lf
  ];
}