{ ...  }:

{
  programs = {
    nushell = {
      enable = true;

      shellAliases = {
        # bonsai = ''cbonsai -il -b 2 -c "o-o,O-o,o-O"'';
        # matrix = "~/.cargo/bin/rusty-rain -s -C 255,131,73";
        # nnn = "nnn -H";
      };

      extraConfig = ''
        $env.config = {
          show_banner: false
        }'';

      extraLogin = ''
        echo "Ololo"
      '';
    };
  };
}
