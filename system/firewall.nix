{ ... }:

{
  # enable NAT
    networking.nat.enable = true;
    networking.nat.enableIPv6 = true;
    networking.nat.externalInterface = "wlan0";
    networking.nat.internalInterfaces = [ "wg0" ];
    networking.firewall = {
      allowedUDPPorts = [ 51820 53 ];
      allowedTCPPorts = [ 53 ];
  };
}
