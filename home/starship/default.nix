{ ... }:

{
  programs = {
    starship = {
      enable = true;

      enableNushellIntegration = true;

      settings = (with builtins; fromTOML (readFile ./gruvbox-rainbow.toml));
    };
  };
}
