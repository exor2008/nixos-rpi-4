{pkgs, config, ...}:
let
  ili9486-kernel-module = pkgs.callPackage ./ili9486-kernel-module.nix {
    # Make sure the module targets the same kernel as your system is using.
    kernel = config.boot.kernelPackages.kernel;
  };
in
{
  boot.extraModulePackages = [
    (ili9486-kernel-module.overrideAttrs (_: {
      patches = [ ./ili9486.patch ];
    }))
  ];
}
