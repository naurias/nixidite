{ de, inputs, ... }: {
  de.mango = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        programs.mangowc.enable = true;
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
          ".config/mango/config.conf" = {
            source = "${inputs.dotfiles}/mango/config.conf";
          };
          ".config/mango/autostart.sh" = {
            source = "${inputs.dotfiles}/mango/autostart.sh";
            executable = true;
          };
        };
      };
  };
}
