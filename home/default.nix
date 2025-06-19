{ ... }:

{
  imports = [
    ./nushell.nix
    ./home-manager.nix
    ./git.nix
    ./kitty.nix
    ./xdg.nix
    ./swayidle.nix
    ./swaylock.nix
    ./icons.nix
    ./vscode.nix
    ./bat.nix
    ./messengers.nix
    ./wlogout
    ./sway
    ./waybar
    ./starship
  ];

  home.stateVersion = "24.05";
}
