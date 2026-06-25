{
  den,
  lib,
  inputs,
  ...
}:
{
  den.aspects.kernel = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        imports = [ inputs.chaotic.nixosModules.default ];
        boot.kernelPackages = pkgs.linuxPackages_cachyos-lto;
      };
  };
}
