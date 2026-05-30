{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    toxic
  ];
}
