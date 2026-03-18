{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages.${stdenv.hostPlatform.system}.default
  ];

  age.secrets.passwd.file = ../../secrets/passwd.age;
}
