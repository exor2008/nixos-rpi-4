{ ... }:

{
  programs = {
    starship = {
      enable = true;

      enableNushellIntegration = true;

      settings = (with builtins; fromTOML (readFile ./clouds.toml));
    };
  };
}
