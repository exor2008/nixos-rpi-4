{ wallpapers, ...  }:

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
        window_logo_path = "${wallpapers}/window-logo.png";
        window_logo_alpha = "0.4";
      };

      keybindings = {
        "cmd+c" = "copy_to_clipboard";
        "cmd+v" = "paste_from_clipboard";
        "shift+cmd+v" = "paste_from_buffer clipboard";
      };
    };
  };
}
