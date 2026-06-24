{ den, lib, ... }:
{
  den.aspects.nvidia = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        services.xserver.videoDrivers = [
          "modesetting"
          "nvidia"
        ];
        hardware.nvidia.open = false;
        hardware.nvidia.modesetting.enable = true;
        hardware.nvidia.nvidiaSettings = true;
        hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
        hardware.nvidia.prime = {
          intelBusId = "PCI:0@0:2:0";
          nvidiaBusId = "PCI:1@0:0:0";
          offload.enable = true;
          offload.enableOffloadCmd = true;
        };
      };

  };
}
