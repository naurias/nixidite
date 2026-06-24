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

        services.xserver.enable = true;
        services.displayManager.sddm = {
          enable = true;
          #theme = "catppuccin-mocha";
          package = pkgs.kdePackages.sddm;
        };
        xdg.portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal
            pkgs.xdg-desktop-portal-gnome
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-wlr
          ];

        };
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
