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

  imports = [
    nixvim.homeManagerModules.nixvim
  ];

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
    cbonsai
    kanagawa-icon-theme
  ];

  #fonts.fontconfig = {
  # enable = true;
  #defaultFonts = {
  #  monospace = [ "JetBrainsMono" ];
  #  sansSerif = [ "JetBrainsMono" ];
  #   serif = [ "JetBrainsMono" ];

  #  };
  #};

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs = {
    home-manager.enable = true;
    nushell = {
      enable = true;
      shellAliases = {
        bonsai = ''cbonsai -il -b 2 -c "o-o,O-o,o-O"'';
        matrix = "~/.cargo/bin/rusty-rain -s -C 255,131,73";
        nnn = "nnn -H";
      };
    };
    kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
      };
      theme = "Spacedust";
      extraConfig = ''
        background #152528
      '';
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
          position = "top";
          height = 30;
          modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
          modules-center = [ "sway/window" ];
          modules-right = [ "cpu" "load" "memory" "network" "disk" "temperature" "keyboard-state" "tray" "clock" ];
          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            on-click = "activate";
          };
          "sway/window" = {
            window-rewrite = {
              "class<kitty>" = "";
            };
          };
          "wlr/taskbar" = {
            #icon-theme = "Dracula";
            icon-theme = "Kanagawa";
            icon-size = 20;
          };
          "sway/mode" = {
            format = "<span style=\"italic\">{}</span>";
          };
          "cpu" = {
            format = "{usage}% ";
          };
          "memory" = {
            format = "{}% ";
          };
          "tray" = {
            spacing = 8;
          };
          "clock" = {
            interval = 60;
            tooltip = false;
            format = "{:%R | %a, %d/%m/%y}";
          };
          "temperature" = {
            critical-threshold = 80;
            format = "{temperatureC}°C {icon}";
            format-icons = [
              ""
              ""
              ""
              ""
            ];
          };
          "network" = {
            # "interface" = "wlp2*"; # (Optional) To force the use of this interface
            format-wifi = "{signalStrength}% ";
            format-ethernet = "{ipaddr}/{cidr} ";
            tooltip-format = "{ifname} via {gwaddr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ";
            format-alt = "{ifname} = {ipaddr}/{cidr} ";
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
      fonts = {
        names = [
          "JetBrainsMono Nerd Font"
        ];
      };
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
          fonts.names = [ "JetBrainsMono Nerd Font" ];
        }
      ];
      menu = "${pkgs.wofi}/bin/wofi --show drun";
      colors = {
        background = "#152528";
        focused = {
          background = "#293E40";
          border = "#FF8349";
          childBorder = "#FF8349";
          text = "#E6EAEA";
          indicator = "#FF8349";
        };
        focusedInactive = {
          background = "#293E40";
          border = "#5A93AA";
          childBorder = "#5A93AA";
          text = "#E6EAEA";
          indicator = "#5A93AA";
        };
        placeholder = {
          background = "#293E40";
          border = "#FF8349";
          childBorder = "#FF8349";
          text = "#E6EAEA";
          indicator = "#FF8349";
        };
        unfocused = {
          background = "#152528";
          border = "#2D4F56";
          childBorder = "#2D4F56";
          text = "#E6EAEA";
          indicator = "#2D4F56";
        };
      };
      window = {
        border = 3;
        # titlebar = false;
        commands = [
          {
            command = "opacity 0.95, border pixel 3";
            criteria = {
              class = ".*";
            };
          }
          {
            command = "opacity 0.95, border pixel 3";
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
