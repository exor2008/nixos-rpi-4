{ config, pkgs, lib, ... }:

let
  nvim = inputs.nixvim.packages.${pkgs.system}.default.extend { config = ./colorscheme.nix; };
  nvim = nvim.extend { config = ./alpha.nix; };
in
{
  environment.systemPackages = [
    nvim
  ];
}