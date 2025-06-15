{ pkgs, lib, ... }:

{
  programs.nixvim = {
    plugins.yazi = {
      enable = true;
    };

    keymaps = [
      {
        key = "<leader>ya";
        action = "<cmd>Yazi<cr>";
        mode = [ "n" "v"];
      }
      {
        key = "<leader>yw";
        action = "<cmd>Yazi cwd<cr>";
        mode = [ "n" "v"];
      }
      {
        key = "<leader>ys";
        action = "<cmd>Yazi toggle<cr>";
        mode = [ "n" "v"];
      }
    ];
  };
}
