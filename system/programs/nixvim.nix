{ config, pkgs, lib, inputs, ... }:

let
  nvim = inputs.nixvim.packages.${pkgs.system}.default;
  nvim.config.colorschemes.nightfox = {
    enable = true;
    flavor = "terafox";
  };
in {
  environment.systemPackages = [
    nvim
  ];
}
