{pkgs, ...}:

{
    home.packages = with pkgs; [ nushell ];
    programs.home-manager.enable = true;

    home.stateVersion = "24.05";
}
