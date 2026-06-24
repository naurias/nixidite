{
  den,
  lib,
  inputs,
  ...
}:
{
  den.aspects.stylix = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        imports = [ inputs.stylix.nixosModules.stylix ];

        stylix.enable = true;
        stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        stylix.image = ./1.png;
        # Fonts
        stylix.fonts = {
          #  sizes = {
          #   terminal = 14;
          # };
          monospace = {
            package = pkgs.nerd-fonts.fira-code;
            name = "FiraCode Nerd Font";
          };
          sansSerif = {
            package = pkgs.ubuntu-sans;
            name = "Ubuntu Sans";
          };
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

        services.awww.enable = true;

        #theming options go here mainly stylix
        #stylix.targets.floorp.enable = true;
        #stylix.targets.floorp.profileNames = [ "nix" ];
        #stylix.targets.floorp.colors.enable = true;
        #stylix.targets.floorp.colorTheme.enable = true;

        # cursor
        stylix.cursor.package = pkgs.bibata-cursors;
        stylix.cursor.name = "Bibata-Modern-Ice";
        stylix.cursor.size = 18;
        # icons
        stylix.icons.enable = true;
        stylix.icons.package = pkgs.papirus-icon-theme;
        stylix.icons.dark = "Papirus-Dark";
        stylix.icons.light = "Papirus";

        qt.enable = true;
        gtk.enable = true;

        # Firefox
        stylix.targets.firefox.profileNames = [ "nix" ];
        # kitty
        stylix.targets.kitty.enable = false;
        programs.kitty = {
          font.name = "FiraCodeNerdFont";
          font.size = 14;
          themeFile = "rose-pine";
          settings = {
            background_opacity = 0.9;
          };
          extraConfig = ''
            bold_font auto
            italic_font CascadiaCode-Italic
            bold_italic_font CascadiaCode-BoldItalic
          '';
        };

      };

  };
}
