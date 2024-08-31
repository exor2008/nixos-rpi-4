{ config, pkgs, lib, ... }:

let
  SSID = "Bella1611";
  SSIDpassword = "Miroslava0831";
  interface = "wlan0";
  hostname = "NixOS-RPI4";
in
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # nixpkgs.config.allowUnfree = true;

  boot = {
    kernelParams = [ "snd_bcm2835.enable_hdmi=1" ]; # audio
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  imports = [
    # <home-manager/nixos>
    <nixos-hardware/raspberry-pi/4>
    ./hardware-configuration.nix
  ];

  hardware = {
    raspberry-pi."4".fkms-3d.enable = true;
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    # raspberry-pi."4".audio.enable = true; # this is broken
    deviceTree.enable = true;
    # pulseaudio.enable = true; # conflicts with pipewire
    graphics.enable = true;
    enableRedistributableFirmware = true;
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

  security = {
    polkit.enable = true;
    pam.services.swaylock = { };
  };

  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
    mc
    nnn
    glxinfo
    drm_info
    git
    gitui
    neofetch
    # automatic-timezoned
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.openssh.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway ";
        user = "greeter";
      };
    };
  };
  services.automatic-timezoned.enable = true;
  time.timeZone = "US/Eastern";
  systemd.services.greetd = {
    unitConfig = {
      After = lib.mkOverride 0 [ "multi-user.target" ];
    };
    serviceConfig = {
      Type = "idle";
    };
  };

  users = {
    mutableUsers = false;
    users.me = {
      isNormalUser = true;
      shell = pkgs.nushell;
      password = "zaq1";
      extraGroups = [ "wheel" "render" "video" ];
    };
    groups.admins = {
      members = [ "root" "me" ];
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [ "JetBrainsMono" ];
    })
  ];

  system.stateVersion = "24.11";
}
