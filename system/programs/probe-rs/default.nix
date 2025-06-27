{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    probe-rs
  ];

  services.udev = {
    enable = true;
    extraRules = builtins.readFile ./69-probe-rs.rules;
  };
}
