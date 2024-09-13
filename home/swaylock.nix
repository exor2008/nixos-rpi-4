{ wallpapers, ... }:

{
  programs = {
    swaylock = {
      enable = true;
      settings = {
        image = "${wallpapers}/lock.png";
        show-keyboard-layout = true;
        indicator-caps-lock = true;
      };
    };
  };
}
