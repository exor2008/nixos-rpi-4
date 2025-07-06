{ lib, ... }:

{
  programs.nixvim = {
    plugins.actions-preview = {
      enable = true;
    };

    keymaps = [
      {
        mode = [
          "v"
          "n"
        ];
        key = "<leader>ca";
        action = "<cmd>lua require('actions-preview').code_actions()<cr>";
        options = {
          silent = true;
          desc = "Code action";
        };
      }
    ];
  };
}
