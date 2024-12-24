{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    htop
    ripgrep
    dust
    wl-clipboard
    gcc
    rustup
    dua
    bottom
    bat
    nmap
    iftop
    qrencode
  ];
}
