{ de, inputs, ... }: {
  de.niri = {
    nixos =
      {
        config,
        lib,
        pkgs,

        ...
      }:
      {

        programs.niri.enable = true;

      };
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        home.file = {
          ".config/niri" = {
            source = "${inputs.dotfiles}/niri";
            recursive = true;
          };
        };
      };
  };
}
