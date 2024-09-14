{ self, pkgs, lib, ... }:

{
  programs = {
    waybar = {
      enable = true;
      style = lib.mkAfter ''
        ${builtins.readFile "${self}/home/waybar/style.css"}
      '';
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          fixed-center = false;
          modules-left = [
            "custom/nix-logo"
            "sway/workspaces"
            "sway/mode"
            "custom/round-right-end"
            "wlr/taskbar"
          ];
          modules-center = [ "sway/window" ];
          modules-right = [ 
            "tray"
            "custom/round-left-end"
            "cpu"
            "custom/round-left"
            "memory"
            "custom/round-left"
            "disk"
            "custom/round-left"
            "pulseaudio"
            "custom/round-left"
            "network"
            "custom/round-left"
            "temperature"
            "custom/round-left"
            "clock"
            "custom/round-left"
            "custom/power"
          ];
          
          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            on-click = "activate";
            on-click-middle = "close";
          };
          
          "sway/mode" = {
            format = "<span style=\"italic\">{}</span>";
          };

          "wlr/taskbar" = {
            icon-theme = "Kanagawa";
            icon-size = 20;
            on-click = "activate";
            on-click-middle = "close";
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
            format = "{}% ";
          };

          "disk" = {
            format = "{used} ";
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
              default = ["" "" ""];
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

          "clock" = {
            interval = 60;
            format = "{:%R | %a, %d/%m/%y}";
            format-alt = "{:%Y-%m-%d}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };

          "custom/power" = {
            format = "⏻ ";
            tooltip = false;
            on-click = "wlogout";
          };

          "custom/round-left" = {
            format = "";
            tooltip = false;
          };

          "custom/round-left-end" = {
            format = "";
            tooltip = false;
          };

          "custom/round-right-end" = {
            format = "";
            tooltip = false;
          };

          "custom/nix-logo" = {
            format = "";
            tooltip = false;
          };
        };
      };
    };
  };
}
