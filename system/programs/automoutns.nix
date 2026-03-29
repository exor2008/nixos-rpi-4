{
  ...
}:

{
  services = {
    gvfs.enable = true;
    udisks2 = {

      enable = true;
      mountOnMedia = true;
    };
    devmon.enable = true;
  };
}
