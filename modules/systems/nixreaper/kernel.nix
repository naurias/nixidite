{ den, lib, ... }:
{
  den.aspects.kernel = {
    nixos = { config, lib, pkgs, ... }:
    {
      boot.kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
