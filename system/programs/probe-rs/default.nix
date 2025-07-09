{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    probe-rs
    elf2uf2-rs
  ];

  services.udev = {
    enable = true;
    extraRules = builtins.readFile ./69-probe-rs.rules;
  };
}
