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
        wayland.windowManager.hyprland = {
          enable = true;
          xwayland.enable = true;
          settings = {
            animation = {
              leaf = "windows";
              enabled = true;
              bezier = "default";
              speed = 0.8;
            };
            monitor = {
              output = "eDP-1";
              mode = "1920x1080@60";
              position = "0x0";
              scale = 1;
            };
            config = {
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
            bind = [
              {
                _args = [
                  "SUPER + RETURN"
                  (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")
                ];
              }
              {
                _args = [
                  "SUPER + D"
                  (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg panel-toggle launcher\")")
                ];
              }
            ];
          };
        };
      };
  };
}
