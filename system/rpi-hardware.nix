{
  config,
  pkgs,
  lib,
  ...
}:

{
  hardware = {
    raspberry-pi."4".fkms-3d.enable = true;
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
    # raspberry-pi."4".audio.enable = true; # this is broken
    # pulseaudio.enable = true; # conflicts with pipewire
    graphics.enable = true;
    enableRedistributableFirmware = true;

    deviceTree = {
      enable = true;
      overlays = [
        {
          name = "spi";
          dtsText = "
/dts-v1/;
/plugin/;

/ {
    compatible = \"brcm,bcm2711\";

    fragment@0 {
        target = <&spi0>;
        __overlay__ {
            status = \"okay\";
            #address-cells = <1>;
            #size-cells = <0>;

            display@0 {
                // compatible = \"waveshare,rpi-lcd-35\", \"ilitek,ili9486\";
                compatible = \"ozzmaker,piscreen\", \"ilitek,ili9486\";
                reg = <0>;
                spi-max-frequency = <10000000>;
                dc-gpios = <&gpio 24 0>;
                reset-gpios = <&gpio 25 0>;
                buswidth = <8>;
                rotation = <0>;
            };
        };
    };

    fragment@1 {
        target = <&spidev0>; // Disable default spidev on CS0
        __overlay__ {
            status = \"disabled\";
        };
    };
};
            ";
        }
      ];
    };
  };

  users.groups.spi = { };

  services.udev.extraRules = ''
    SUBSYSTEM=="spidev", KERNEL=="spidev0.0", GROUP="spi", MODE="0660"
  '';
}
