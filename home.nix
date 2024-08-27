{ config, pkgs, lib, ... }:
let
  nixvim = import <nixvim>;
in
{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
    ];

  home.username = "me";
  home.homeDirectory = "/home/me";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [ nixvim.homeManagerModules.nixvim ];

  home.packages = with pkgs; [
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    wofi
    nemo
    htop
    lf
    nixpkgs-fmt
    rustup
    gcc
    dust
    ripgrep
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs = {
    home-manager.enable = true;
    kitty = {
      enable = true;
      theme = "Spacedust";
    };
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
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "bottom";
          height = 30;
          modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
          modules-center = [ "sway/window" ];
          modules-right = [ "mpd" "temperature" ];

          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
          };
        };
      };
    };
    nixvim = {
      enable = true;
      colorschemes.nightfox = {
        enable = true;
        flavor = "terafox";
      };
      plugins = {
        telescope.enable = true;
        lightline.enable = true;
      };
      opts = {
        number = true;
        relativenumber = true;
      };
      globals.mapleader = " ";
      keymaps = [
        {
          action = "<cmd>Telescope live_grep<CR>";
          key = "<leader>g";
        }
      ];
    };
    vscode = {
      enable = true;
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
      gaps = {
        smartGaps = true;
        smartBorders = "on";
        inner = 10;
      };
      bars = [
        {
          command = "${pkgs.waybar}/bin/waybar";
        }
      ];
      menu = "${pkgs.wofi}/bin/wofi --show drun";
      window = {
        border = 3;
        # titlebar = false;
        commands = [
          {
            command = "opacity 0.9, border pixel 3";
            criteria = {
              class = ".*";
            };
          }
          {
            command = "opacity 0.9, border pixel 3";
            criteria = {
              app_id = ".*";
            };
          }

        ];
      };
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
