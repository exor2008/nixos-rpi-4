{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    settings = {
      theme = builtins.fromTOML ''
        [flavor]
        use = "nightfly"
      '';

      yazi = builtins.fromTOML ''
        [[plugin.prepend_previewers]]
        url = "*.md"
        run = 'piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'
      '';

      keymap = builtins.fromTOML ''
        [[mgr.prepend_keymap]]
        on   = [ "g", "i" ]
        run  = "plugin lazygit"
        desc = "run lazygit"

        [[mgr.prepend_keymap]]
        on   = [ "<C-y>" ]
        run  = "plugin wl-clipboard"
        desc = "copy to wl-clipboard"
      '';
    };

    initLua = ./init.lua;

    flavors = {
      nightfly = "/home/ian/nightfly";
    };

    plugins = with pkgs.yaziPlugins; {
      inherit
        piper
        full-border
        lazygit
        wl-clipboard
        ;
    };
  };

  environment.systemPackages = with pkgs; [
    glow
    lazygit
    piper
  ];
}
