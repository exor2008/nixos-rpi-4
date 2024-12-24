{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages.${system}.default
  ];

  age.secrets.passwd.file = /home/ian/secrets/passwd.age;
}
