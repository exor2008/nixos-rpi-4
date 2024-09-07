{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    checkConfig = false;  # workaround for https://discourse.nixos.org/t/sway-fails-with-cannot-create-gles2-renderer-after-update/45703
  };
}