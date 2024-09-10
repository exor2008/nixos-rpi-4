{ ...  }:

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
      };

      keybindings = {
        "cmd+c" = "copy_to_clipboard";
        "cmd+v" = "paste_from_clipboard";
        "shift+cmd+v" = "paste_from_buffer clipboard";
      };
    };
  };
}
