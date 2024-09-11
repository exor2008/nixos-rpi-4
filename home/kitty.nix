{ pkgs, ...  }:

let 
  wallpaper = pkgs.fetchFromGitHub {
    owner = "exor2008";
    repo = "stardog";
    rev = "d87fdf10644c2f575910f238c9ce657c53bcd051";
    hash = "sha256-nW9VagxLZhlQDTO/hikvLl6uby9O/7GefxDikrVV3E8=";
  }; 
in 
{
  programs = {
    kitty = {
      enable = true;
      
      font = {
        name = "JetBrainsMono Nerd Font";
      };
      
      theme = "Spacedust";
      
      settings = {
        copy_on_select = "clipboard";
        background = "#152528";
        window_logo_path = "${wallpaper}/window-logo.png";
      };

      keybindings = {
        "cmd+c" = "copy_to_clipboard";
        "cmd+v" = "paste_from_clipboard";
        "shift+cmd+v" = "paste_from_buffer clipboard";
      };
    };
  };
}
