{ de, inputs, ... }:
{
  de.noctalia = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
        # NOTE: ~/.config/noctalia content (palettes + settings) is owned by
        # den.aspects.theme now. Palettes for every theme are installed from
        # the central palette and selected at runtime via `theme-switch`.
      };
  };
}

