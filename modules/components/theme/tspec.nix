{
  den,
  lib,
  inputs,
  neo,
  de,
  ...
}:
{
  den.aspects.tspec = {
    nixos =
      {
        user,
        config,
        lib,
        pkgs,
        ...
      }:
      {
        specialisation.kanagawa.configuration = {
          stylix.base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
          home-manager.users.${user.name} = {
            programs.kitty.themeFile = lib.mkForce "kanagawa";
            home.file =  {
              ".config/noctalia" = {
                source = lib.mkForce "${inputs.dotfiles}/kanagawa/noctalia";
                recursive = true;
              };
              ".config/doom/style.el" = {
                source = lib.mkForce "${inputs.dotfiles}/kanagawa/doom/style.el";
              };
              ".config/neomark/markdown.css" = {
                source = lib.mkForce "${inputs.dotfiles}/kanagawa/neovim/markdown.css";
              };
              ".config/ghostty/theme.ghostty" = {
                source = lib.mkForce "${inputs.dotfiles}/kanagawa/ghostty/theme.ghostty";
              };
            };
            programs.nvf.settings.vim.theme = lib.mkForce {
              enable = true;
              name = "base16";
            };
            stylix.targets.nvf = lib.mkForce {
              enable = true;
            };
          };
        };


        specialisation.kanagawadragon.configuration = {
          stylix.base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/kanagawa-dragon.yaml";
          home-manager.users.${user.name} = {
            programs.kitty.themeFile = lib.mkForce "kanagawa_dragon";
            home.file =  {
              ".config/noctalia" = {
                source = lib.mkForce "${inputs.dotfiles}/kanagawa-dragon/noctalia";
                recursive = true;
              };
              ".config/doom/style.el" = {
                source = lib.mkForce "${inputs.dotfiles}/kanagawa-dragon/doom/style.el";
              };
              ".config/neomark/markdown.css" = {
                source = lib.mkForce "${inputs.dotfiles}/kanagawa-dragon/neovim/markdown.css";
              };
              ".config/ghostty/theme.ghostty" = {
                source = lib.mkForce "${inputs.dotfiles}/kanagawa-dragon/ghostty/theme.ghostty";
              };
            };
            programs.nvf.settings.vim.theme = lib.mkForce {
              enable = true;
              name = "base16";
            };
            stylix.targets.nvf = lib.mkForce {
              enable = true;
            };
          };
        };



        specialisation.tokyonight.configuration = {
          stylix.base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
          home-manager.users.${user.name} = {
            programs.kitty.themeFile = lib.mkForce "tokyo_night_night";
            home.file = {
              ".config/noctalia" = {
                source = lib.mkForce "${inputs.dotfiles}/tokyonight/noctalia";
                recursive = true;
              };
              ".config/doom/style.el" = {
                source = lib.mkForce "${inputs.dotfiles}/tokyonight/doom/style.el";
              };
              ".config/neomark/markdown.css" = {
                source = lib.mkForce "${inputs.dotfiles}/tokyonight/neovim/markdown.css";
              };
              ".config/ghostty/theme.ghostty" = {
                source = lib.mkForce "${inputs.dotfiles}/tokyonight/ghostty/theme.ghostty";
              };
            };
            programs.nvf.settings.vim.theme = lib.mkForce {
              enable = true;
              name = "tokyonight";
              style = "storm";
            };
          };
        };
        specialisation.rose-pine.configuration = {
          stylix.base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
          home-manager.users.${user.name} = {
            programs.kitty.themeFile = lib.mkForce "rose-pine";
            home.file = {
              ".config/noctalia" = {
                source = lib.mkForce "${inputs.dotfiles}/rosepine/noctalia";
                recursive = true;
              };
              ".config/doom/style.el" = {
                source = lib.mkForce "${inputs.dotfiles}/rosepine/doom/style.el";
              };
              ".config/neomark/markdown.css" = {
                source = lib.mkForce "${inputs.dotfiles}/rosepine/neovim/markdown.css";
              };
              ".config/ghostty/theme.ghostty" = {
                source = lib.mkForce "${inputs.dotfiles}/rosepine/ghostty/theme.ghostty";
              };
            };
            programs.nvf.settings.vim.theme = lib.mkForce {
              enable = true;
              name = "rose-pine";
              style = "main";
            };
          };
        };

        specialisation.catppuccin.configuration = {
          stylix.base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
          home-manager.users.${user.name} = {
            programs.kitty.themeFile = lib.mkForce "Catppuccin-Mocha";
            home.file = {
              ".config/noctalia" = {
                source = lib.mkForce "${inputs.dotfiles}/catppuccin/noctalia";
                recursive = true;
              };
              ".config/doom/style.el" = {
                source = lib.mkForce "${inputs.dotfiles}/catppuccin/doom/style.el";
              };
              ".config/neomark/markdown.css" = {
                source = lib.mkForce "${inputs.dotfiles}/catppuccin/neovim/markdown.css";
              };
              ".config/ghostty/theme.ghostty" = {
                source = lib.mkForce "${inputs.dotfiles}/catppuccin/ghostty/theme.ghostty";
              };
            };
            programs.nvf.settings.vim.theme = lib.mkForce {
              enable = true;
              name = "catppuccin";
              style = "mocha";
            };
          };
        };


      };
  };
}
