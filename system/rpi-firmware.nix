{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
    mesa-demos
    drm_info
  ];
}

