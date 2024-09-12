{ self, pkgs, ... }:

{
  programs = {
    waybar = {
      enable = true;
      style = mkAfter ''
        ${builtins.readFile "${self}/home/waybar/style.css"}
      '';
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
          modules-center = [ "sway/window" ];
          modules-right = [ 
            "tray"
            "cpu"
            "memory"
            "disk"
            "pulseaudio"
            "network"
            "temperature"
            "keyboard-state"
            "sway/language"
            "clock"
            "custom/power"
          ];
          
          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            on-click = "activate";
          };
          
          "sway/mode" = {
            format = "<span style=\"italic\">{}</span>";
          };

          "wlr/taskbar" = {
            #icon-theme = "Dracula";
            icon-theme = "Kanagawa";
            icon-size = 20;
          };

          "sway/window" = {
            window-rewrite = {
              "class<kitty>" = "";
            };
          };

          "tray" = {
            spacing = 8;
          };

          "cpu" = {
            format = "{usage}% ";
          };

          "memory" = {
            format = "{}% ";
          };

          "disk" = {
            format = "{}% ";
          };

          "pulseaudio" = {
            scroll-step = 1;
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["", "", ""];
            };
            on-click = "pavucontrol";
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

          "keyboard-state" = {
            numlock = true;
            capslock = true;
            format = "{name} {icon}";
            format-icons = {
              locked = "";
              unlocked = ""
            };
          };

          "clock" = {
            interval = 60;
            format = "{:%R | %a, %d/%m/%y}";
            format-alt = "{:%Y-%m-%d}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };

          "custom/power" = {
            format = "⏻ ";
            tooltip = false;
            menu = "on-click";
            menu-file = ${builtins.readFile "${self}/home/waybar/power_menu.xml"}
            menu-actions = {
              shutdown = "shutdown";
              reboot = "reboot";
              suspend = "systemctl suspend";
              hibernate = "systemctl hibernate";
            };
          };

        };
      };
    };
  };
}