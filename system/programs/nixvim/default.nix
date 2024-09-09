{ pkgs, lib, inputs, ... }:

let
  colorsheme = import ./colorscheme.nix { inherit pkgs lib inputs; };
  alpha = import ./alpha.nix { inherit pkgs lib inputs; };

  nvim1 = inputs.nixvim.packages.${pkgs.system}.default.extend { config = colorsheme.config; };
  nvim = nvim1.extend { config = alpha.config; };
in
{
  environment.systemPackages = [
    nvim
  ];
}
