{ config, pkgs, lib, ... }:

programs = {
  kitty = {
    enable = true;
    
    font = {
      name = "JetBrainsMono Nerd Font";
    };
    
    theme = "Spacedust";
    
    extraConfig = ''
      background #152528
    '';
  };
}