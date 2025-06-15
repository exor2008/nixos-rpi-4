{ pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    colorschemes.nightfox = {
      enable = true;
      flavor = "terafox";
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    plugins = {
      treesitter.enable = true;
      autoclose.enable = true;
      which-key.enable = true;
      colorizer.enable = true;
      lualine = {
        enable = true;
        settings.options.theme = "moonfly";
      };
    };
  };

  imports = [
    ./lsp.nix
    ./cmp.nix
    ./conform.nix
    ./telescope.nix
    ./yazi.nix
    ./luasnip.nix
  ];
}
