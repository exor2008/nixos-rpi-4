{ config, pkgs, lib, inputs, ... }:

let
  inputs.nixvim.packages.${pkgs.system}.default.override {
    colorschemes = {
      nightfox = {
        enable = true;
        flavor = "terafox";
      };
    };
  };

  nvim = inputs.nixvim.packages.${pkgs.system}.default;
in {


  environment.systemPackages = [
    nvim
  ];
}
