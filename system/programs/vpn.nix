{ pkgs, ... }:

{
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.0.0.1/24" "fdc9:281f:04d7:9ee9::1/64" ];

      listenPort = 42586;

      # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
      # For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
            postSetup = ''
        ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.0.0.1/24 -o wlan0 -j MASQUERADE
        ${pkgs.iptables}/bin/ip6tables -A FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/ip6tables -t nat -A POSTROUTING -s fdc9:281f:04d7:9ee9::1/64 -o wlan0 -j MASQUERADE
      '';

      # This undoes the above command
            postShutdown = ''
        ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.0.0.1/24 -o wlan0 -j MASQUERADE
        ${pkgs.iptables}/bin/ip6tables -D FORWARD -i wg0 -j ACCEPT
        ${pkgs.iptables}/bin/ip6tables -t nat -D POSTROUTING -s fdc9:281f:04d7:9ee9::1/64 -o wlan0 -j MASQUERADE
      '';

      privateKeyFile = "/home/ian/vpn/private";

      peers = [
        # List of allowed peers.
        { # laptop ssh
          publicKey = "v2r95mIa9TTAAEG0tYdbh2OQFeV/ABtequIpL8c8ixU=";
          allowedIPs = [ "10.0.0.2/32" "fdc9:281f:04d7:9ee9::2/128" ];
        }
        { # android ssh
          publicKey = "vvaS1PhZ3n3M5V7kl5WiOGKXyizGzS7cgJAdjgfS5hE=";
          allowedIPs = [ "10.0.0.3/32" "fdc9:281f:04d7:9ee9::3/128" ];
        }
        { # phone
          publicKey = "RHHIAYzo9ktL7cqGzygOjmmpulSKE7XHCR9exWbzXjE=";
          allowedIPs = [ "10.0.0.4/32" "fdc9:281f:04d7:9ee9::4/128" ];
        }
        { # dudelka
          publicKey = "3nGW7Eje6EKmE2LVsQsrD/7MZGFONuVjFNQZkZoR8iA=";
          allowedIPs = [ "10.0.0.5/32" "fdc9:281f:04d7:9ee9::5/128" ];
        }
        { # babsveta
          publicKey = "XX95xuzKxM0O3hJONqOywrnhogiPxsuvEXylrF713VE=";
          allowedIPs = [ "10.0.0.6/32" "fdc9:281f:04d7:9ee9::6/128" ];
        }
        { # max
          publicKey = "Co/jMfGAcib3RszXoAxZIwk3cIRBe0dQ+a1PBMn1O3U=";
          allowedIPs = [ "10.0.0.7/32" "fdc9:281f:04d7:9ee9::7/128" ];
        }
      ];
    };
  };

  services = {
    dnsmasq = {
      enable = true;
      settings = {
        interface="wg0";
      };
    };
  };
}
