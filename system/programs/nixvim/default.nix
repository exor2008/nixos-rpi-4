{ pkgs, lib, inputs, ... }:

let
  colorsheme = import ./colorscheme.nix { inherit pkgs lib inputs; };
  alpha = import ./alpha.nix { inherit pkgs lib inputs; };
  clipboard = import ./clipboard.nix { inherit pkgs lib inputs; };

  nvim_color = inputs.nixvim.packages.${pkgs.system}.default.extend { config = colorsheme.config; };
  nvim_clipboard = nvim_color.extend { config = clipboard.config; };
  nvim = nvim_clipboard.extend { config = alpha.config; };
in
{
  environment.systemPackages = [
    nvim
  ];
}
