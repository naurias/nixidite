{ de, ... }:
{
  de.desktop = {
    includes = [
      de.fonts
      de.niri
      de.noctalia
      de.hyprland
    ];
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      let
        sddm-astronaut =
          (pkgs.sddm-astronaut.override {
            embeddedTheme = "japanese_aesthetic"; # or any other theme
            themeConfig = {
              HeaderTextColor = "#d5c4a1";
              Background = "Backgrounds/2.png";
              # ... other theme configuration options
            };
          }).overrideAttrs
            (oldAttrs: {
              installPhase = oldAttrs.installPhase + ''
                chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
                cp ${./2.png} \
                  $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/2.png
              '';
            });
      in
      {
        environment.systemPackages = with pkgs; [ sddm-astronaut ];
        services.xserver.enable = true;
        services.displayManager.sddm = {
          enable = true;
          package = pkgs.kdePackages.sddm;
          theme = "sddm-astronaut-theme";
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
        home.packages = with pkgs; [
          grim
          slurp
          swappy
          ydotool
          xwayland-satellite
          cava
          cliphist
          kdePackages.qtmultimedia
          # inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
          quickshell
        ];
      };
  };
}
