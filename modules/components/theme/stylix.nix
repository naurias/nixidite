{
  den,
  lib,
  inputs,
  ...
}:
{
  den.aspects.stylix = {
    includes = [
      den.aspects.tspec
    ];
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
        stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
        stylix.image = ./1.jpg;
        stylix.polarity = "dark";
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
        # terminal theming 
        home.file = {
          ".config/doom" = {
            source = "${inputs.dotfiles}/common/doom";
            recursive = true;
          };
          ".config/doom/style.el" = {
            source = "${inputs.dotfiles}/gruvbox/doom/style.el";
          };
          ".config/ghostty/theme.ghostty" = {
            source = "${inputs.dotfiles}/gruvbox/ghostty/theme.ghostty";
          };
          ".config/neomark/markdown.css" = {
              source = "${inputs.dotfiles}/gruvbox/neovim/markdown.css";
            };
          ".config/nvim/lua/plugins/colors.lua" = {
              source = "${inputs.dotfiles}/gruvbox/neovim/colors.lua";
            };
        };

        services.awww.enable = true;

        home.pointerCursor.enable = true;

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
        # NVF
        # stylix.targets.nvf.enable = false;
        # kitty
        stylix.targets.kitty.enable = false;
        programs.kitty = {
          font.name = "FiraCodeNerdFont";
          font.size = 14;
          themeFile = "gruvbox-dark";
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
