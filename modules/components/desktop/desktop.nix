{ de, ... }:
{
  de.desktop = {
    includes = [
      de.fonts
      de.niri
      de.noctalia
      de.mango
    ];
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          grim
          slurp
          swappy
          ydotool
          xwayland-satellite
          cava
          cliphist
          kdePackages.qtmultimedia
          # inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
          quickshell
        ];
      };
  };
}
