{ config, pkgs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
   # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    waybar
    wofi
    nemo
    htop
    lf
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs = {
    home-manager.enable = true;
    kitty.enable = true;
    git = {
      enable = true;
      userEmail = "exorsteam2008@gmail.com";
      userName = "exor2008";
    };
    swaylock = {
      enable = true;
      settings = {
        image = "${config.home.homeDirectory}/wallpapers/lock.png";
        show-keyboard-layout = true;
        indicator-caps-lock = true;
      };
    };
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 60 * 15; # 15 min
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
    ];
  };

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    wrapperFeatures.gtk = true;
    checkConfig = false;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      output = {
        HDMI-A-1 = {
          mode = "1920x1080@60Hz bg ${config.home.homeDirectory}/wallpapers/native-american-history-wallpaper.png stretch";
	};
      };
      workspaceAutoBackAndForth = true;
      gaps.smartGaps = true;
      gaps.smartBorders = "on";
      bars = [
        { 
	  command = "${pkgs.waybar}/bin/waybar"; 
	  position = "bottom";
	}
      ];
      menu = "${pkgs.wofi}/bin/wofi --show drun";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs;[
      xdg-desktop-portal-wlr
      # xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };
}
