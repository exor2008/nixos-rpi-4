{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    htop
    ripgrep
    dust
    wl-clipboard
    wlogout
  ];
}
