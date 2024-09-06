{ config, pkgs, lib, inputs, ... }:

let
  nvim = inputs.nixvim.packages."x86_64-linux".default;
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
