{ pkgs, ... }:

{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 60 * 1; # 1 min
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
    ];
  };
}