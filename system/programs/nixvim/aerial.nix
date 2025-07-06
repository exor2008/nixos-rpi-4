{ lib, ... }:

{
  programs.nixvim = {
    plugins.aerial = {
      enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>a";
        action = "<cmd>AerialToggle!<cr>";
        options = {
          silent = true;
          desc = "Aerial";
        };
      }
    ];
  };
}
