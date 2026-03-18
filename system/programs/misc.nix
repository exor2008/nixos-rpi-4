{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    htop
    ripgrep
    dust
    wl-clipboard
    # gcc
    # rustup
    dua
    bottom
    # nmap
    # iftop
    # qrencode
    # tui-journal
    repgrep
    serie
    # netscanner
    # tshark
    # brave
    cbonsai
    fd
    nixfmt
    usbutils
    fastfetch

    ## for the kenel modeules dev
    # linux_rpi4.dev
    # gnumake
    # dtc
  ];
}
