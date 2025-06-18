{ pkgs, lib, ... }:

{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
    };

    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        mode = "n";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        mode = "n";
      }
      {
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
        mode = "n";
      }
      {
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<cr>";
        mode = "n";
      }
    ];
  };
}
