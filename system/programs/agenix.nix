{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages.${system}.default
  ];

  age.secrets.passwd.file = ../../secrets/passwd.age;
}
