{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
    glxinfo
    drm_info
  ];
}