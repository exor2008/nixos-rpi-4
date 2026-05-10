{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    file
    binutils
  ];

}
