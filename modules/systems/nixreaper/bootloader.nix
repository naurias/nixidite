{ den, lib, ... }:
{
  den.aspects.limine = {
    nixos = {
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.limine.enable = true;
      boot.loader.limine.efiSupport = true;
    };
  };
}