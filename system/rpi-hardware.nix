{ config, pkgs, lib, ... }:

{
  hardware = {
    raspberry-pi."4".fkms-3d.enable = true;
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    # raspberry-pi."4".audio.enable = true; # this is broken
    # pulseaudio.enable = true; # conflicts with pipewire
    graphics.enable = true;
    enableRedistributableFirmware = true;

    deviceTree = {
      enable = true;
      overlays = [
        {
          name = "spi";
          dtboFile = ./spi0-0cs.dtbo;
        }
      ];
    };
  };

  users.groups.spi = {};

  services.udev.extraRules = ''
    SUBSYSTEM=="spidev", KERNEL=="spidev0.0", GROUP="spi", MODE="0660"
  '';
}
