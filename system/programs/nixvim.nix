{ config, pkgs, lib, inputs, ... }:

let
  nvim = inputs.nixvim.packages.${pkgs.system}.default;
  
in {
  nvim.override {
    colorschemes = {
      nightfox = {
        enable = true;
        flavor = "terafox";
      };
    };
  };

  environment.systemPackages = [
    nvim
  ];
}
