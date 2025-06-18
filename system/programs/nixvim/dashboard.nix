{ pkgs, lib, ... }:

{
  programs.nixvim = {
    plugins = {
      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
          config = {
            header = [
              "                                                                                         "
              "                                                                                         "
              "                                                                                         "
              "                                                                                         "
              "                                                                                         "
              "                                       ▀▄   ▄▀                ▄ ▀▄   ▄▀ ▄                "
              "                                      ▄█▀███▀█▄               █▄███████▄█                "
              "                                     █▀███████▀█   ▄▄████▄▄   ███▄███▄███     ▄██▄       "
              "                                     █ █▀▀▀▀▀█ █  ██████████  ▀█████████▀   ▄██████▄     "
              "                                        ▀▀ ▀▀     ██▄▄██▄▄██   ▄▀     ▀▄   ███▄██▄███    "
              "                                                   ▄▀▄▀▀▄▀▄                  ▄▀▄▄▀▄      "
              "                                                  ▀        ▀                ▀ ▀  ▀ ▀     "
              "                                                                                         "
              "                                                            ▄▄████▄▄                     "
              "                                   __                     ▄██████████▄                   "
              "      ___     ___    ___   __  __ /\\_\\    ___ ___       ▄██▄██▄██▄██▄██▄                 "
              "     / _ `\\  / __`\\ / __`\\/\\ \\/\\ \\\\/\\ \\  / __` __`\\       ▀█▀  ▀▀  ▀█▀                   "
              "    /\\ \\/\\ \\/\\  __//\\ \\_\\ \\ \\ \\_/ |\\ \\ \\/\\ \\/\\ \\/\\ \\                                     "
              "    \\ \\_\\ \\_\\ \\____\\ \\____/\\ \\___/  \\ \\_\\ \\_\\ \\_\\ \\_\\                                    "
              "     \\/_/\\/_/\\/____/\\/___/  \\/__/    \\/_/\\/_/\\/_/\\/_/                                    "
              "                                                                                         "
              "                                                                                         "
              "                                                                                         "
              "                                                                                         "
              "                                                                                         "
            ];
            center = [
              {
                action = "Telescope find_files";
                desc = "Find File";
                icon = " ";
                key = "f";
                key_format = "	%s";
              }
              {
                action = "Telescope live_grep";
                desc = "Find words";
                icon = "󱩾 ";
                key = "g";
                key_format = "	%s";
              }
              {
                action.__raw = "function() require('persistence').load() end";
                desc = "Restore Session";
                icon = " ";
                key = "s";
                key_format = "	%s";
              }
              {
                action = "qa";
                desc = "Quit Neovim";
                icon = " ";
                key = "q";
                key_format = "	%s";
              }
            ];
          };
        };
      };
    };
  };
}
