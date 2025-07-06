{ pkgs, ... }:

{
  environment = {
    localBinInPath = true;
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      EDITOR = "nvim";
      SSL_CERT_FILE = "/etc/ssl/certs/ca-bundle.crt";
    };
    variables.EDITOR = "nvim";
  };
}
