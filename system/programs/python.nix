{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    uv
    black
    isort
    mypy
  ];

  programs.nix-ld.enable = true;

  # Add this to pyrightconfig.json
  #
  # {
  #   "venvPath": ".",               // where virtualenvs live
  #   "venv": ".venv",                     // name of the venv
  # }

}
