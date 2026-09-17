{ de, ... }:
{
  de.desktop = {
    includes = [
      de.fonts
      # de.niri
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
              HeaderTextColor = "#ebdbb2";
              DateTextColor = "#ebdbb2";
              TimeTextColor = "#fbf1c7";
              FormBackgroundColor = "#282828";
              BackgroundColor = "#1d2021";
              DimBackgroundColor = "#1d2021";
              LoginFieldBackgroundColor = "#3c3836";
              PasswordFieldBackgroundColor = "#3c3836";
              LoginFieldTextColor = "#ebdbb2";
              PasswordFieldTextColor = "#ebdbb2";
              UserIconColor = "#a89984";
              PasswordIconColor = "#a89984";
              PlaceholderTextColor = "#928374";
              WarningColor = "#fb4934";
              LoginButtonTextColor = "#282828";
              LoginButtonBackgroundColor = "#d65d0e";
              SystemButtonsIconsColor = "#ebdbb2";
              SessionButtonTextColor = "#ebdbb2";
              VirtualKeyboardButtonTextColor = "#ebdbb2";
              DropdownTextColor = "#ebdbb2";
              DropdownSelectedBackgroundColor = "#504945";
              DropdownBackgroundColor = "#3c3836";
              HighlightTextColor = "#282828";
              HighlightBackgroundColor = "#d79921";
              HighlightBorderColor = "transparent";
              HoverUserIconColor = "#fe8019";
              HoverPasswordIconColor = "#fe8019";
              HoverSystemButtonsIconsColor = "#fe8019";
              HoverSessionButtonTextColor = "#fe8019";
              HoverVirtualKeyboardButtonTextColor = "#fe8019";
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
        environment.systemPackages = with pkgs; [
          sddm-astronaut
          kdePackages.qtmultimedia
        ];
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
          # inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };
  };
}
