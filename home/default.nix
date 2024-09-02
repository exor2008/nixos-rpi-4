{pkgs, ...}:

{
    home.packages = with pkgs; [ nushell ];
    programs.home-manager.enable = true;
}