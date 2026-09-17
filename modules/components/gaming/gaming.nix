{ den, lib, ... }:
{
  den.aspects.gaming = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        hardware.graphics = {
          enable = true;
          enable32Bit = true;
        };
        programs.steam.enable = true;
        programs.steam.gamescopeSession.enable = true;
        # not needed due in modern dirivers
        #programs.gamemode.enable = true;
        environment.systemPackages = with pkgs; [
          protonup-ng
          steam-run
          wineWow64Packages.stagingFull
          lutris
          faugus-launcher
        ];
      };
    homeManager =
      { config, ... }:
      {
        home.sessionVariables = {
          STEAM_EXTRA_COMPAT_TOOLS_PATH = "${config.home.homeDirectory}/.steam/root/compatibilitytools.d";
        };
      };

  };
}
