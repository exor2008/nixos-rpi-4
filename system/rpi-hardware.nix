{
  config,
  pkgs,
  lib,
  ...
}:

{
  hardware = {
    raspberry-pi."4".fkms-3d.enable = true;
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    # raspberry-pi."4".audio.enable = true; # this is broken
    # pulseaudio.enable = true; # conflicts with pipewire
    graphics.enable = true;
    enableRedistributableFirmware = true;

  };
}
