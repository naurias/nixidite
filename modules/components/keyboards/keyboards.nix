{ den, lib, ... }:
{
  den.aspects.keyboards = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        services.libinput.enable = true;
        services.xserver.xkb.layout = "us,graphite";
        services.xserver.xkb.variant = ",";
        services.xserver.xkb.options = "grp:alt_shift_toggle";
        services.xserver.xkb.extraLayouts = {
          graphite = {
            description = "Graphite layout";
            languages = [ "eng" ];
            symbolsFile = ./graphite.xkb;
          };
        };
      };

  };
}
