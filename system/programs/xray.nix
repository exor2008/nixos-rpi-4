{ pkgs, ... }:
let
  xrayConfig = builtins.fromJSON (builtins.readFile /etc/nixos/secrets/vpn.json);
in
{
  services = {
    xray = {
      enable = true;
      settings = {
        log = {
          loglevel = "info";
        };

        routing = {
          rules = [];
          domainStrategy = "AsIs";
        };

        inbounds = [
          {
            port = 23;
            tag = "ss";
            protocol = "shadowsocks";
            settings = {
              method = "2022-blake3-aes-128-gcm";
              password = xrayConfig.ss.password;
              network = "tcp,udp";
            };
          }

          {
            port = 443;
            protocol = "trojan";
            tag = "trojan_tls";
            settings = {
              clients = [
                {
                  password = xrayConfig.trojan.password;
                }
              ];
              fallbacks = [
                {
                  dest = 80;
                }
              ];
            };

            streamSettings = {
              network = "tcp";
              security = "reality";
              realitySettings = {
                show = false;
                dest = xrayConfig.trojan.dest;
                xver = 0;
                serverNames = xrayConfig.trojan.serverNames;
                privateKey = xrayConfig.trojan.privateKey;
                minClientVer = "";
                maxClientVer = "";
                shortIds = xrayConfig.trojan.shortIds;
                fingerpint = xrayConfig.trojan.fingerpint;
              };
            };

            sniffing = {
              enabled = true;
              destOverride = ["http" "tls"];
            };
          }
        ];

        outbounds = [
          {
            protocol = "freedom";
            tag = "direct";
          }
          {
            protocol = "blackhole";
            tag = "block";
          }
        ];
      };
    };
  };
}
