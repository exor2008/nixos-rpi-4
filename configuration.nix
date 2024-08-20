{ config, pkgs, lib, ... }:

let
  user = "ian";
  SSID = "Bella1611";
  SSIDpassword = "Miroslava0831";
  interface = "wlan0";
  hostname = "NixOS-RP-PI-4B";
in {

  boot = {
    kernelParams = ["snd_bcm2835.enable_hdmi=1"]; # audio
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
   };
  };

  imports = [
    <nixos-hardware/raspberry-pi/4>
    ./hardware-configuration.nix
  ];

  hardware = { 
    raspberry-pi."4".fkms-3d.enable = true;
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    # raspberry-pi."4".audio.enable = true; # this is broken
    deviceTree.enable = true;
    pulseaudio.enable = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking = {
    hostName = hostname;
    wireless = {
      enable = true;
      networks."${SSID}".psk = SSIDpassword;
      interfaces = [ interface ];
    };
  };
  
  # security.rtkit.enable = true;
  # services.pipewire = {
  # enable = true;
  # alsa.enable = true;
  # alsa.support32Bit = true;
  # pulse.enable = true;
  # jack.enable = true;
  #};
 
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  #programs.sway = { 
  #  enable = true;
  #  wrapperFeatures.gtk = true;
  #};
  #services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [ 
    libraspberrypi
    raspberrypi-eeprom
    neovim 
    nushell
    mc
    nnn
    waybar
    mako
    swww
    kitty
    rofi-wayland
    chromium
    glxinfo
    grim
    drm_info
    git
    gitui
  ];

  services.openssh.enable = true;

  users = {
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      password = "zaq1";
      extraGroups = [ "wheel" "render" "video" ];
    };
  };

  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "24.11";
}
