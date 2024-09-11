{ pkgs, ...  }:

let 
  wallpaper = pkgs.fetchFromGitHub {
    owner = "exor2008";
    repo = "stardog";
    rev = "aaadabd57aaa29266db1fe19432441f1df989641";
    hash = "sha256-4rCHN2PIjpX9OoVKtfJNrzL7GDk42K226KvJ9oDh5Wg=";
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
