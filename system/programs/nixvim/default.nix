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
      crates.enable = true;
      csvview.enable = true;
      cursorline.enable = true;
      glance.enable = true;
      hex.enable = true;
      lastplace.enable = true;
      vim-surround.enable = true;
      persistence.enable = true;
      barbecue.enable = true;
      web-devicons.enable = true;
      fidget.enable = true;
    };
  };

  imports = [
    ./lsp.nix
    ./cmp.nix
    ./conform.nix
    ./telescope.nix
    ./yazi.nix
    ./luasnip.nix
    ./barbar.nix
    ./dashboard.nix
    ./dap.nix
    ./actions-preview.nix
    ./aerial.nix
  ];
}
