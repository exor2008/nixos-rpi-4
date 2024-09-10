{ config, pkgs, lib, ... }:

{
  boot = {
    kernelParams = [ "snd_bcm2835.enable_hdmi=1" ]; # audio
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };
}