{ den, lib, ... }:
{
  den.aspects.network = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        networking.networkmanager.enable = true;
        hardware.bluetooth.enable = true;
        services.udisks2.enable = true;
        services.resolved.enable = false;
        services.gvfs.enable = true;
      };

  };
}
