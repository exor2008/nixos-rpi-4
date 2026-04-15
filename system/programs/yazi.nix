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
    };

    flavors = {
      nightfly = "/home/ian/nightfly";
    };

    plugins = with pkgs.yaziPlugins; {
      inherit piper;
    };
  };

  environment.systemPackages = with pkgs; [
    glow
    piper
  ];
}
