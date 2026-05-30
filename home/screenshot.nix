{ pkgs, ... }:
{
  programs.satty = {
    enable = true;
  };

  home.packages = with pkgs; [
    slurp
    grim
  ];
}
