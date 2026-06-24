{ den, lib, ... }:
{
  den.aspects.power = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        services.power-profiles-daemon.enable = true;
        services.upower.enable = true;
      };

  };
}
