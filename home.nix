{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "me";
  home.homeDirectory = "/home/me";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
   # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    waybar
    htop
    lf
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.kitty.enable = true;
  programs.nushell.enable = true;
  programs.git = {
    enable = true;
    userEmail = "exorsteam2008@gmail.com";
    userName = "exor2008";
  };
#  programs.waybar = {
#    enable = true;
#    systemd.enable = true;
#  };

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
	  # command = "i3bar"; 
	  position = "bottom";
	}
      ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs;[
      xdg-desktop-portal-wlr
#      xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };
}
