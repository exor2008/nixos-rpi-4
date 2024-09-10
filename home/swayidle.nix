{ pkgs, ... }:

{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 60 * 60 * 3; # 3 hours
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
    ];
  };
}