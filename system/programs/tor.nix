{ pkgs, ... }:
{
  services = {
    tor = {
      enable = true;
      torsocks.enable = true;
      client.enable = true;
    };

    privoxy = {
      enable = true;
      enableTor = true;
    };
  };
  environment.systemPackages = [
    (pkgs.tor-browser.overrideAttrs (
      finalAttrs: previousAttrs: {
        src = pkgs.fetchurl {
          urls = [
            "https://nightlies.tbb.torproject.org/nightly-builds/tor-browser-builds/tbb-nightly.2026.03.27/nightly-linux-aarch64/tor-browser-linux-aarch64-tbb-nightly.2026.03.27.tar.xz"
          ];
          hash = "sha256-tOOrMBs7ZiIKehd5ShGEA3eWTVd3jeg3uG12Se3b6jQ=";
        };
        meta.platforms = [ "aarch64-linux" ];
        buildPhase =
          builtins.replaceStrings
            [ "fontconfig/fonts.conf" "TorBrowser/Data/Tor/torrc-defaults" ]
            [ "fonts/fonts.conf" "TorBrowser/Tor/torrc-defaults" ]
            previousAttrs.buildPhase;
      }
    ))
  ];
}
