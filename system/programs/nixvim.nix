{ config, pkgs, lib, inputs, ... }:

let
  nvim = inputs.nixvim.packages.${pkgs.system}.default;
  # nvim.config.colorschemes = 
in {
  nvim = {
    enable = true;
    colorschemes.nightfox = {
      enable = true;
      flavor = "terafox";
    };
  };

  environment.systemPackages = [
    nvim
  ];
}
