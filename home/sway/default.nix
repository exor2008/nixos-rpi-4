{ config, pkgs, lib, ... }:

let 
  wallpaper = fetchurl {
    url = "https://github.com/exor2008/stardog/blob/main/wallpaper.png"; # replace with the actual image URL
    sha256 = "0h7ax86idilqw87aqxamvlmchr0slnjchimlwmmjxy6hq4jh9yx4"; # Replace with actual hash
  };
in 
{
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    checkConfig = false;  # workaround for https://discourse.nixos.org/t/sway-fails-with-cannot-create-gles2-renderer-after-update/45703
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      workspaceAutoBackAndForth = true;
    };
  };

  imports = [ 
    ./output.nix
    ./font.nix
  ];
}