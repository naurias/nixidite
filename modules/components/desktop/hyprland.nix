{ de, inputs, ... }: {
  de.hyprland = {
    nixos =
      {
        config,
        lib,
        pkgs,

        ...
      }:
      {

        programs.hyprland.enable = true;

        xdg.portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-hyprland
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
        home.packages = with pkgs; [
          hyprshutdown
        ];
        home.file.".config/hypr/extra.lua".source = "${inputs.dotfiles}/hypr/extra.lua";
        wayland.windowManager.hyprland = {
          enable = true;
          xwayland.enable = true;
          extraConfig = ''
            require("extra")
          '';
          settings = {
            mainMod = {
              _var = "SUPER";
            };
            on = {
              _args = [
                "hyprland.start"
                (lib.generators.mkLuaInline "function()\n  hl.exec_cmd(\"noctalia\")\nend")
              ];
            };
            monitor = {
              output = "eDP-1";
              mode = "1920x1080@60";
              position = "0x0";
              scale = 1;
            };
            config = {
              master = {
                new_status = "master";
                new_on_top = true;
              };
              scrolling = {
                column_width = 1;
                direction = "down";
              };
              general = {
                layout = "master";
                border_size = 2;
                gaps_in = 3;
                gaps_out = 5;
              };
              decoration = {
                rounding = 3;
                blur = {
                  enabled = true;
                  size = 6;
                  passes = 2;
                  new_optimizations = true;
                };
              };
              animations = {
                enabled = true;
              };
              input = {
                kb_layout = "us,graphite";
                kb_variant = ",";
                numlock_by_default = true;
                resolve_binds_by_sym = true;
                follow_mouse = 1;
                touchpad = {
                  disable_while_typing = true;
                };
              };
            };
          };
        };
      };
  };
}
