{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    checkConfig = false;  # workaround for https://discourse.nixos.org/t/sway-fails-with-cannot-create-gles2-renderer-after-update/45703
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      workspaceAutoBackAndForth = true;
    };
    extraConfig = ''
      corner_radius 6
    '';
  };

  imports = [ 
    ./output.nix
    ./font.nix
    ./bars.nix
    ./gaps.nix
    ./menu.nix
    ./colors.nix
    ./window.nix
  ];
}
