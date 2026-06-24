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
        home.file = {
          ".config/noctalia" = {
            source = "${inputs.dotfiles}/noctalia";
            recursive = true;
          };
        };
      };
  };
}

