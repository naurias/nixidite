{ den, lib, inputs, ... }:
let
  # ── Central palette: single source of truth for all runtime theming ──
  # No Stylix, no NixOS specialisations. All apps derive from this.
  themes = {
    gruvbox = {
      label = "Gruvbox Dark";
      polarity = "dark";
      bg = "#282828";
      bgDark = "#1d2021";
      surface = "#3c3836";
      surface2 = "#504945";
      fg = "#ebdbb2";
      muted = "#928374";
      accent = "#fabd2f";
      accentFg = "#282828";
      border = "#665c54";
      black = "#282828";
      red = "#cc241d";
      green = "#98971a";
      yellow = "#d79921";
      blue = "#458588";
      magenta = "#b16286";
      cyan = "#689d6a";
      white = "#a89984";
      bBlack = "#928374";
      bRed = "#fb4934";
      bGreen = "#b8bb26";
      bYellow = "#fabd2f";
      bBlue = "#83a598";
      bMagenta = "#d3869b";
      bCyan = "#8ec07c";
      bWhite = "#fbf1c7";
      cursor = "#bdae93";
      selection = "#d65d0e";
      doomTheme = "doom-gruvbox";
      doomCss = "gruvbox-dark.css";
      nvimScheme = "gruvbox";
      batTheme = "gruvbox-dark";
      noctaliaPalette = "GruvboxMain";
      kvantumTheme = "Gruvbox";
    };
    kanagawa = {
      label = "Kanagawa Wave";
      polarity = "dark";
      bg = "#1f1f28";
      bgDark = "#16161d";
      surface = "#2a2a37";
      surface2 = "#363646";
      fg = "#dcd7ba";
      muted = "#727169";
      accent = "#7e9cd8";
      accentFg = "#1f1f28";
      border = "#54546d";
      black = "#1f1f28";
      red = "#c34043";
      green = "#76946a";
      yellow = "#c0a36e";
      blue = "#7e9cd8";
      magenta = "#957fb8";
      cyan = "#6a9589";
      white = "#c8c093";
      bBlack = "#727169";
      bRed = "#e82424";
      bGreen = "#98bb6c";
      bYellow = "#e6c384";
      bBlue = "#7fb4ca";
      bMagenta = "#938aa9";
      bCyan = "#7aa89f";
      bWhite = "#dcd7ba";
      cursor = "#dcd7ba";
      selection = "#2d4f67";
      doomTheme = "doom-kanagawa";
      doomCss = "kanagawa-dark.css";
      nvimScheme = "kanagawa-wave";
      batTheme = "TwoDark";
      noctaliaPalette = "KanagawaMain";
      kvantumTheme = "Kanagawa";
    };
    kanagawa-dragon = {
      label = "Kanagawa Dragon";
      polarity = "dark";
      bg = "#181616";
      bgDark = "#0d0c0c";
      surface = "#282727";
      surface2 = "#393836";
      fg = "#c5c9c5";
      muted = "#737c73";
      accent = "#8ba4b0";
      accentFg = "#181616";
      border = "#43436a";
      black = "#181616";
      red = "#c4746e";
      green = "#8a9a7b";
      yellow = "#c4b28a";
      blue = "#8ba4b0";
      magenta = "#a292a3";
      cyan = "#8ea4a2";
      white = "#c5c9c5";
      bBlack = "#737c73";
      bRed = "#e46876";
      bGreen = "#87a987";
      bYellow = "#e6c384";
      bBlue = "#7fb4ca";
      bMagenta = "#938aa9";
      bCyan = "#7aa89f";
      bWhite = "#c5c9c5";
      cursor = "#c5c9c5";
      selection = "#2d4f67";
      doomTheme = "doom-kanagawa-dragon";
      doomCss = "kanagawa-dragon.css";
      nvimScheme = "kanagawa-dragon";
      batTheme = "TwoDark";
      noctaliaPalette = "KanagawaDragonMain";
      kvantumTheme = "Kanagawa-Dragon";
    };
    tokyonight = {
      label = "Tokyo Night";
      polarity = "dark";
      bg = "#1a1b26";
      bgDark = "#16161e";
      surface = "#24283b";
      surface2 = "#292e42";
      fg = "#c0caf5";
      muted = "#565f89";
      accent = "#7aa2f7";
      accentFg = "#1a1b26";
      border = "#414868";
      black = "#1a1b26";
      red = "#f7768e";
      green = "#9ece6a";
      yellow = "#e0af68";
      blue = "#7aa2f7";
      magenta = "#bb9af7";
      cyan = "#7dcfff";
      white = "#a9b1d6";
      bBlack = "#414868";
      bRed = "#ff899d";
      bGreen = "#9fe044";
      bYellow = "#faba4a";
      bBlue = "#8db0ff";
      bMagenta = "#c7a9ff";
      bCyan = "#a4daff";
      bWhite = "#c0caf5";
      cursor = "#c0caf5";
      selection = "#33467c";
      doomTheme = "doom-tokyo-night";
      doomCss = "tokyonight.css";
      nvimScheme = "tokyonight-night";
      batTheme = "TwoDark";
      noctaliaPalette = "TokyoNightMain";
      kvantumTheme = "TokyoNight";
    };
    rosepine = {
      label = "Rosé Pine";
      polarity = "dark";
      bg = "#191724";
      bgDark = "#13111c";
      surface = "#1f1d2e";
      surface2 = "#26233a";
      fg = "#e0def4";
      muted = "#6e6a86";
      accent = "#c4a7e7";
      accentFg = "#191724";
      border = "#403d52";
      black = "#191724";
      red = "#eb6f92";
      green = "#9ccfd8";
      yellow = "#f6c177";
      blue = "#31748f";
      magenta = "#c4a7e7";
      cyan = "#ebbcba";
      white = "#e0def4";
      bBlack = "#6e6a86";
      bRed = "#f083a2";
      bGreen = "#a6d5d9";
      bYellow = "#ffd39e";
      bBlue = "#65a6c4";
      bMagenta = "#d7b9f2";
      bCyan = "#f2c8c7";
      bWhite = "#e0def4";
      cursor = "#e0def4";
      selection = "#403d52";
      doomTheme = "doom-rose-pine";
      doomCss = "rosepine.css";
      nvimScheme = "rose-pine-main";
      batTheme = "Coldark-Dark";
      noctaliaPalette = "RosePineMain";
      kvantumTheme = "RosePine";
    };
    catppuccin = {
      label = "Catppuccin Mocha";
      polarity = "dark";
      bg = "#1e1e2e";
      bgDark = "#181825";
      surface = "#313244";
      surface2 = "#45475a";
      fg = "#cdd6f4";
      muted = "#6c7086";
      accent = "#cba6f7";
      accentFg = "#1e1e2e";
      border = "#45475a";
      black = "#1e1e2e";
      red = "#f38ba8";
      green = "#a6e3a1";
      yellow = "#f9e2af";
      blue = "#89b4fa";
      magenta = "#f5c2e7";
      cyan = "#94e2d5";
      white = "#bac2de";
      bBlack = "#585b70";
      bRed = "#f38ba8";
      bGreen = "#a6e3a1";
      bYellow = "#f9e2af";
      bBlue = "#89b4fa";
      bMagenta = "#f5c2e7";
      bCyan = "#94e2d5";
      bWhite = "#cdd6f4";
      cursor = "#f5e0dc";
      selection = "#45475a";
      doomTheme = "doom-catppuccin-mocha";
      doomCss = "catppuccin-mocha.css";
      nvimScheme = "catppuccin-mocha";
      batTheme = "Catppuccin Mocha";
      noctaliaPalette = "CatppuccinMochaMain";
      kvantumTheme = "Catppuccin-Mocha";
    };
    everforest = {
      label = "Everforest Dark";
      polarity = "dark";
      bg = "#2b3339";
      bgDark = "#22292f";
      surface = "#323c41";
      surface2 = "#3a454a";
      fg = "#d3c6aa";
      muted = "#859289";
      accent = "#a7c080";
      accentFg = "#2b3339";
      border = "#4a555c";
      black = "#2b3339";
      red = "#e67e80";
      green = "#a7c080";
      yellow = "#dbbc7f";
      blue = "#7fbbb3";
      magenta = "#d699b6";
      cyan = "#83c092";
      white = "#d3c6aa";
      bBlack = "#4a555c";
      bRed = "#e67e80";
      bGreen = "#a7c080";
      bYellow = "#dbbc7f";
      bBlue = "#7fbbb3";
      bMagenta = "#d699b6";
      bCyan = "#83c092";
      bWhite = "#d3c6aa";
      cursor = "#d3c6aa";
      selection = "#4a555c";
      doomTheme = "doom-everforest";
      doomCss = null;
      nvimScheme = "everforest";
      batTheme = "gruvbox-dark";
      noctaliaPalette = "EverforestMain";
      kvantumTheme = "Everforest";
    };
    dracula = {
      label = "Dracula";
      polarity = "dark";
      bg = "#282a36";
      bgDark = "#21222c";
      surface = "#343746";
      surface2 = "#44475a";
      fg = "#f8f8f2";
      muted = "#6272a4";
      accent = "#bd93f9";
      accentFg = "#282a36";
      border = "#44475a";
      black = "#282a36";
      red = "#ff5555";
      green = "#50fa7b";
      yellow = "#f1fa8c";
      blue = "#8be9fd";
      magenta = "#ff79c6";
      cyan = "#8be9fd";
      white = "#f8f8f2";
      bBlack = "#6272a4";
      bRed = "#ff6e6e";
      bGreen = "#69ff94";
      bYellow = "#ffffa5";
      bBlue = "#a4ffff";
      bMagenta = "#ff92df";
      bCyan = "#a4ffff";
      bWhite = "#ffffff";
      cursor = "#f8f8f2";
      selection = "#44475a";
      doomTheme = "doom-dracula";
      doomCss = null;
      nvimScheme = "dracula";
      batTheme = "Dracula";
      noctaliaPalette = "DraculaMain";
      kvantumTheme = "Dracula";
    };
    nord = {
      label = "Nord";
      polarity = "dark";
      bg = "#2e3440";
      bgDark = "#242933";
      surface = "#3b4252";
      surface2 = "#434c5e";
      fg = "#eceff4";
      muted = "#4c566a";
      accent = "#88c0d0";
      accentFg = "#2e3440";
      border = "#4c566a";
      black = "#2e3440";
      red = "#bf616a";
      green = "#a3be8c";
      yellow = "#ebcb8b";
      blue = "#81a1c1";
      magenta = "#b48ead";
      cyan = "#88c0d0";
      white = "#e5e9f0";
      bBlack = "#4c566a";
      bRed = "#bf616a";
      bGreen = "#a3be8c";
      bYellow = "#ebcb8b";
      bBlue = "#81a1c1";
      bMagenta = "#b48ead";
      bCyan = "#8fbcbb";
      bWhite = "#eceff4";
      cursor = "#eceff4";
      selection = "#434c5e";
      doomTheme = "doom-nord";
      doomCss = null;
      nvimScheme = "nord";
      batTheme = "Nord";
      noctaliaPalette = "NordMain";
      kvantumTheme = "Nord";
    };
    onedark = {
      label = "One Dark";
      polarity = "dark";
      bg = "#282c34";
      bgDark = "#21252b";
      surface = "#2c313a";
      surface2 = "#353b45";
      fg = "#abb2bf";
      muted = "#5c6370";
      accent = "#61afef";
      accentFg = "#282c34";
      border = "#3e4451";
      black = "#282c34";
      red = "#e06c75";
      green = "#98c379";
      yellow = "#e5c07b";
      blue = "#61afef";
      magenta = "#c678dd";
      cyan = "#56b6c2";
      white = "#abb2bf";
      bBlack = "#5c6370";
      bRed = "#e06c75";
      bGreen = "#98c379";
      bYellow = "#e5c07b";
      bBlue = "#61afef";
      bMagenta = "#c678dd";
      bCyan = "#56b6c2";
      bWhite = "#ffffff";
      cursor = "#abb2bf";
      selection = "#3e4451";
      doomTheme = "doom-one";
      doomCss = null;
      nvimScheme = "onedark";
      batTheme = "OneHalfDark";
      noctaliaPalette = "OneDarkMain";
      kvantumTheme = "OneDark";
    };
  };
  themeNames = builtins.attrNames themes;
  defaultTheme = "gruvbox";

  noHash = lib.removePrefix "#";

  # kdeglobals wants decimal R,G,B: convert palette hex at build time.
  hexDigits = {
    "0" = 0; "1" = 1; "2" = 2; "3" = 3; "4" = 4; "5" = 5; "6" = 6; "7" = 7;
    "8" = 8; "9" = 9; a = 10; b = 11; c = 12; d = 13; e = 14; f = 15;
    A = 10; B = 11; C = 12; D = 13; E = 14; F = 15;
  };
  hexPair = s: hexDigits.${lib.substring 0 1 s} * 16 + hexDigits.${lib.substring 1 1 s};
  hexToRgb = hex:
    let h = lib.removePrefix "#" hex; in
    "${toString (hexPair (lib.substring 0 2 h))},${toString (hexPair (lib.substring 2 2 h))},${toString (hexPair (lib.substring 4 2 h))}";

  mkKdeEnv = t: ''
    # Generated by den.aspects.theme for ${t.label} - sourced by theme-switch
    VIEW_BG=${hexToRgb t.bg}
    VIEW_BG_ALT=${hexToRgb t.surface}
    VIEW_FG=${hexToRgb t.fg}
    VIEW_FG_DIM=${hexToRgb t.muted}
    ACCENT=${hexToRgb t.accent}
    ACCENT_FG=${hexToRgb t.accentFg}
    SURFACE=${hexToRgb t.surface}
    SURFACE2=${hexToRgb t.surface2}
  '';

  # ── Kvantum: standalone themes derived from the wallbash base ──
  # Base reference: wallbash (Arc-Dark-derived, Catppuccin-Mocha-Rosewater),
  # stored identically in every dot-nix <theme>/noctalia/templates/ dir.
  # The base is static (no Noctalia placeholders); mapping is key-aware,
  # not blind hex substitution: the same base hex means bgDark in
  # GeneralColors but accentFg where it sits on an accent fill.
  kvconfigTpl = builtins.readFile "${inputs.dotfiles}/gruvbox/noctalia/templates/kvantum.kvconfig";
  svgTpl = builtins.readFile "${inputs.dotfiles}/gruvbox/noctalia/templates/kvantum.svg";

  mkKvconfig = t:
    let
      # pass0: readability fixes independent of palette: opaque file
      # managers/editors (translucency hurts text). The base is already
      # solid (translucent_windows=false); keep its opacity tuning.
      pass0 = lib.replaceStrings
        [
          "opaque=kaffeine,kmplayer,subtitlecomposer,kdenlive,vlc,smplayer,smplayer2,avidemux,avidemux2_qt4,avidemux3_qt4,avidemux3_qt5,kamoso,QtCreator,VirtualBox,VirtualBoxVM,trojita,dragon,digikam,lyx"
        ]
        [
          "opaque=kaffeine,kmplayer,subtitlecomposer,kdenlive,vlc,smplayer,smplayer2,avidemux,avidemux2_qt4,avidemux3_qt4,avidemux3_qt5,kamoso,QtCreator,VirtualBox,VirtualBoxVM,trojita,dragon,digikam,lyx,dolphin,pcmanfm-qt,pcmanfm,okular,keepassxc,qbittorrent,ark,gwenview,kate,konsole"
        ]
        kvconfigTpl;
      # pass1: key-aware roles: text on accent fills, links, tooltip base.
      pass1 = lib.replaceStrings
        [
          "highlight.color=#F5E0DC"
          "inactive.highlight.color=#F5E0DC"
          "highlight.text.color=#181825"
          "link.color=#F5E0DC"
          "link.visited.color=#89B4FA"
          "tooltip.text.color=#CDD6F4"
          "text.press.color=#181825"
          "text.toggle.color=#181825"
          "text.normal.color=#585B70"
          "text.focus.color=#F5E0DC"
          "text.press.color=#F5E0DC"
          "text.toggle.color=#F5E0DC"
        ]
        [
          "highlight.color=${t.accent}"
          "inactive.highlight.color=${t.accent}"
          "highlight.text.color=${t.accentFg}"
          "link.color=${t.accent}"
          "link.visited.color=${t.blue}"
          "tooltip.base.color=${t.surface2}\ntooltip.text.color=${t.fg}"
          "text.press.color=${t.accentFg}"
          "text.toggle.color=${t.accentFg}"
          "text.normal.color=${t.muted}"
          "text.focus.color=${t.accent}"
          "text.press.color=${t.accent}"
          "text.toggle.color=${t.accent}"
        ]
        pass0;
      # pass2: structural fills that keep their role in every section.
      pass2 = lib.replaceStrings
        [
          "window.color=#1E1E2E"
          "base.color=#181825"
          "alt.base.color=#181825"
          "button.color=#313244"
          "light.color=#45475A"
          "mid.light.color=#45475A"
          "dark.color=#181825"
          "mid.color=#181825"
        ]
        [
          "window.color=${t.bg}"
          "base.color=${t.bgDark}"
          "alt.base.color=${t.bgDark}"
          "button.color=${t.surface}"
          "light.color=${t.surface2}"
          "mid.light.color=${t.surface2}"
          "dark.color=${t.bgDark}"
          "mid.color=${t.bgDark}"
        ]
        pass1;
      # pass3: remaining text/disabled roles (all #CDD6F4 normals).
      pass3 = lib.replaceStrings
        [
          "text.color=#CDD6F4"
          "window.text.color=#CDD6F4"
          "button.text.color=#CDD6F4"
          "disabled.text.color=#585B70"
          "text.normal.color=#CDD6F4"
          "text.focus.color=#CDD6F4"
          "text.press.color=#CDD6F4"
          "text.toggle.color=#CDD6F4"
        ]
        [
          "text.color=${t.fg}"
          "window.text.color=${t.fg}"
          "button.text.color=${t.fg}"
          "disabled.text.color=${t.muted}"
          "text.normal.color=${t.fg}"
          "text.focus.color=${t.fg}"
          "text.press.color=${t.fg}"
          "text.toggle.color=${t.fg}"
        ]
        pass2;
    in
    pass3;

  mkSvg = t:
    lib.replaceStrings
      [
        "#1E1E2E"
        "#181825"
        "#313244"
        "#45475A"
        "#585B70"
        "#F5E0DC"
        "#CDD6F4"
        "#F38BA8"
        "#CBA6F7"
        "#000000"
        "#141414"
        "#31363b"
        "#7f7f7f"
        "#919191"
        "#999999"
        "#a6a6a6"
        "#b4b4b4"
        "#b6b6b6"
        "#bebebe"
        "#bfbfbf"
        "#d2d2d2"
        "#d6d6d6"
        "#dcdcdc"
        "#eaeaea"
      ]
      [
        t.bg
        t.bgDark
        t.surface
        t.surface2
        t.border
        t.accent
        t.fg
        t.red
        t.accent
        t.bgDark
        t.bgDark
        t.surface2
        t.muted
        t.muted
        t.muted
        t.muted
        t.muted
        t.muted
        t.muted
        t.muted
        t.muted
        t.muted
        t.muted
        t.muted
      ]
      svgTpl;

  # ── Per-app generators (all take a theme record `t`) ──
  mkKitty = t: ''
    background ${t.bg}
    foreground ${t.fg}
    selection_background ${t.selection}
    selection_foreground ${t.fg}
    cursor ${t.cursor}
    cursor_text_color ${t.accentFg}
    url_color ${t.cyan}
    color0 ${t.black}
    color1 ${t.red}
    color2 ${t.green}
    color3 ${t.yellow}
    color4 ${t.blue}
    color5 ${t.magenta}
    color6 ${t.cyan}
    color7 ${t.white}
    color8 ${t.bBlack}
    color9 ${t.bRed}
    color10 ${t.bGreen}
    color11 ${t.bYellow}
    color12 ${t.bBlue}
    color13 ${t.bMagenta}
    color14 ${t.bCyan}
    color15 ${t.bWhite}
    active_tab_background ${t.accent}
    active_tab_foreground ${t.accentFg}
    inactive_tab_background ${t.surface}
    inactive_tab_foreground ${t.muted}
    tab_bar_background ${t.bg}
  '';

  mkGhostty = t: ''
    background = ${t.bg}
    foreground = ${t.fg}
    selection-background = ${t.selection}
    selection-foreground = ${t.fg}
    cursor-color = ${t.cursor}
    cursor-text = ${t.accentFg}
    palette = 0=${t.black}
    palette = 1=${t.red}
    palette = 2=${t.green}
    palette = 3=${t.yellow}
    palette = 4=${t.blue}
    palette = 5=${t.magenta}
    palette = 6=${t.cyan}
    palette = 7=${t.white}
    palette = 8=${t.bBlack}
    palette = 9=${t.bRed}
    palette = 10=${t.bGreen}
    palette = 11=${t.bYellow}
    palette = 12=${t.bBlue}
    palette = 13=${t.bMagenta}
    palette = 14=${t.bCyan}
    palette = 15=${t.bWhite}
  '';

  mkHyprLua = t: ''
    -- Generated by den.aspects.theme. Sourced at the end of hyprland.lua via require("theme").
    hl.config({
      general = {
        col = {
          active_border = "rgb(${noHash t.accent})",
          inactive_border = "rgb(${noHash t.border})",
        },
      },
      decoration = {
        shadow = {
          color = "rgba(${noHash t.bgDark}99)",
        },
      },
    })
  '';

  mkGtkCss = t: ''
    /* Generated by den.aspects.theme for ${t.label} */
    @define-color accent_color ${t.accent};
    @define-color accent_bg_color ${t.accent};
    @define-color accent_fg_color ${t.accentFg};
    @define-color destructive_color ${t.red};
    @define-color destructive_bg_color ${t.red};
    @define-color destructive_fg_color ${t.accentFg};
    @define-color success_color ${t.green};
    @define-color success_bg_color ${t.green};
    @define-color success_fg_color ${t.accentFg};
    @define-color warning_color ${t.yellow};
    @define-color warning_bg_color ${t.yellow};
    @define-color warning_fg_color ${t.accentFg};
    @define-color error_color ${t.red};
    @define-color error_bg_color ${t.red};
    @define-color error_fg_color ${t.accentFg};
    @define-color window_bg_color ${t.bg};
    @define-color window_fg_color ${t.fg};
    @define-color view_bg_color ${t.bg};
    @define-color view_fg_color ${t.fg};
    @define-color headerbar_bg_color ${t.surface};
    @define-color headerbar_fg_color ${t.fg};
    @define-color headerbar_border_color ${t.border};
    @define-color headerbar_backdrop_color @window_bg_color;
    @define-color headerbar_shade_color rgba(0, 0, 0, 0.07);
    @define-color sidebar_bg_color ${t.surface};
    @define-color sidebar_fg_color ${t.fg};
    @define-color sidebar_backdrop_color @window_bg_color;
    @define-color sidebar_shade_color rgba(0, 0, 0, 0.07);
    @define-color card_bg_color ${t.surface};
    @define-color card_fg_color ${t.fg};
    @define-color dialog_bg_color ${t.surface};
    @define-color dialog_fg_color ${t.fg};
    @define-color popover_bg_color ${t.surface};
    @define-color popover_fg_color ${t.fg};
    @define-color shade_color rgba(0, 0, 0, 0.07);
    @define-color scrollbar_outline_color ${t.border};
    @define-color blue_1 ${t.blue};
    @define-color blue_2 ${t.blue};
    @define-color blue_3 ${t.blue};
    @define-color blue_4 ${t.blue};
    @define-color blue_5 ${t.bBlue};
    @define-color green_1 ${t.green};
    @define-color green_2 ${t.green};
    @define-color green_3 ${t.green};
    @define-color green_4 ${t.green};
    @define-color green_5 ${t.bGreen};
    @define-color yellow_1 ${t.yellow};
    @define-color yellow_2 ${t.yellow};
    @define-color yellow_3 ${t.yellow};
    @define-color yellow_4 ${t.yellow};
    @define-color yellow_5 ${t.bYellow};
    @define-color orange_1 ${t.yellow};
    @define-color orange_2 ${t.yellow};
    @define-color orange_3 ${t.yellow};
    @define-color red_1 ${t.red};
    @define-color red_2 ${t.red};
    @define-color red_3 ${t.bRed};
    @define-color purple_1 ${t.magenta};
    @define-color purple_2 ${t.magenta};
    @define-color purple_3 ${t.bMagenta};
    @define-color brown_1 ${t.muted};
    @define-color brown_2 ${t.muted};
    @define-color light_1 ${t.fg};
    @define-color light_2 ${t.fg};
    @define-color light_3 ${t.bWhite};
    @define-color dark_1 ${t.fg};
    @define-color dark_2 ${t.muted};
    @define-color dark_3 ${t.border};
  '';

  mkOmp = t: ''
    #:schema https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json
    # Generated by den.aspects.theme for ${t.label}

    version = 2
    final_space = true

    [[blocks]]
      type = 'prompt'
      alignment = 'left'
      newline = true

      [[blocks.segments]]
        type = 'os'
        style = 'plain'
        foreground = 'p:os'
        template = '{{.Icon}} '

      [[blocks.segments]]
        type = 'session'
        style = 'plain'
        foreground = 'p:blue'
        template = '{{ .UserName }} '

      [[blocks.segments]]
        type = 'path'
        style = 'plain'
        foreground = 'p:pink'
        template = '{{ .Path }} '

        [blocks.segments.properties]
          folder_icon = '....'
          home_icon = '~'
          style = 'full'

      [[blocks.segments]]
        type = 'git'
        style = 'plain'
        foreground = 'p:lavender'
        template = ' {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>'

        [blocks.segments.properties]
          branch_icon = ' '
          cherry_pick_icon = ' '
          commit_icon = ' '
          fetch_status = true
          fetch_upstream_icon = false
          merge_icon = ' '
          no_commits_icon = ' '
          rebase_icon = ' '
          revert_icon = ' '
          tag_icon = ' '

    [[blocks]]
      type = 'rprompt'
      overflow = 'hidden'

      [[blocks.segments]]
        type = 'executiontime'
        style = 'plain'
        foreground = 'yellow'
        background = 'transparent'
        template = '{{ .FormattedMs }}'

        [blocks.segments.properties]
          threshold = 500

    [[blocks]]
     type = 'prompt'
     alignment = 'left'
     newline = true

      [[blocks.segments]]
        type = 'text'
        style = 'plain'
        foreground = 'p:closer'
        template = ''

    [palette]
      blue = '${t.blue}'
      closer = 'p:os'
      lavender = '${t.bBlue}'
      os = '${t.muted}'
      pink = '${t.magenta}'
  '';

  mkNvimColors = t: ''
    -- Generated by den.aspects.theme for ${t.label}
    -- Restart Neovim (or :Lazy reload) after theme-switch.
    return {
      { "ellisonleao/gruvbox.nvim" },
      { "rebelot/kanagawa.nvim" },
      { "catppuccin/nvim", name = "catppuccin" },
      { "rose-pine/neovim", name = "rose-pine" },
      { "folke/tokyonight.nvim" },
      { "neanias/everforest-nvim" },
      { "Mofiqul/dracula.nvim" },
      { "shaunsingh/nord.nvim" },
      { "navarasu/onedark.nvim" },
      {
        "LazyVim/LazyVim",
        opts = {
          colorscheme = "${t.nvimScheme}",
        },
      },
    }
  '';

  mkDoomStyle = t: ''
    ;; Generated by den.aspects.theme for ${t.label}
    (setq doom-theme '${t.doomTheme})
    (after! doom-themes
      (setq doom-themes-enable-bold t
            doom-themes-enable-italic t))

    (defun org-doom-themed ()
      "Themed Org header colors for ${t.label}."
      (interactive)
      (dolist
          (face
           '((org-level-1 1.8 "${t.bRed}" ultra-bold)
             (org-level-2 1.4 "${t.bYellow}" extra-bold)
             (org-level-3 1.2 "${t.bGreen}" bold)
             (org-level-4 1.1 "${t.bBlue}" semi-bold)
             (org-level-5 1.1 "${t.bMagenta}" normal)
             (org-level-6 1.1 "${t.muted}" normal)
             (org-level-7 1.1 "${t.accent}" normal)
             (org-level-8 1.1 "${t.bCyan}" normal)))
        (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
        (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "${t.fg}"))
    ${lib.optionalString (t.doomCss != null) ''
    ;; HTML THEMING (Org export)
    (after! org
      (when (file-exists-p (expand-file-name "~/.config/doom/${t.doomCss}"))
        (setq org-html-head
              (concat
               "<style type=\"text/css\">\n"
               (with-temp-buffer
                 (insert-file-contents (expand-file-name "~/.config/doom/${t.doomCss}"))
                 (buffer-string))
               "\n</style>"))))
    ''}
  '';

  mkYazi = t: ''
    # Generated by den.aspects.theme for ${t.label}
    [manager]
    cwd = { fg = "${t.accent}", bold = true }
    hovered = { fg = "${t.fg}", bg = "${t.surface2}" }
    preview_hovered = { underline = true }
    find_keyword = { fg = "${t.yellow}", bold = true, underline = true }
    marker_selected = { fg = "${t.accent}", bg = "${t.accent}" }
    marker_copied = { fg = "${t.green}", bg = "${t.green}" }
    marker_cut = { fg = "${t.red}", bg = "${t.red}" }
    tab_active = { fg = "${t.accentFg}", bg = "${t.accent}" }
    tab_inactive = { fg = "${t.muted}", bg = "${t.surface}" }
    border_symbol = "│"
    border_style = { fg = "${t.border}" }

    [status]
    overall = { fg = "${t.fg}", bg = "${t.bg}" }
    sep_left = { open = "", close = "" }
    sep_right = { open = "", close = "" }

    [which]
    mask = { bg = "${t.surface2}" }
    cand = { fg = "${t.cyan}" }
    rest = { fg = "${t.muted}" }
    desc = { fg = "${t.magenta}" }

    [tasks]
    hovered = { fg = "${t.fg}", bg = "${t.surface2}", underline = true }
  '';

  mkFzf = t: ''
    # Generated by den.aspects.theme for ${t.label} - sourced from zsh init
    export BAT_THEME="${t.batTheme}"
    export FZF_DEFAULT_OPTS="--preview='bat --color=always -n {}' --bind 'ctrl-/:toggle-preview' --color=bg:${t.bg},fg:${t.fg},hl:${t.accent},fg+:${t.fg},bg+:${t.surface2},hl+:${t.accent},info:${t.muted},prompt:${t.accent},pointer:${t.accent},marker:${t.green},spinner:${t.cyan},header:${t.muted},border:${t.border}"
  '';

  mkNeomark = t: ''
    /* Generated by den.aspects.theme for ${t.label} */
    :root {
      --bg: ${t.bg};
      --panel: ${t.surface};
      --stroke: ${t.border};
      --fg: ${t.fg};
      --fg-muted: ${t.muted};
      --link: ${t.bCyan};
      --code-bg: ${t.surface2};
      --blockquote-border: ${t.border};
      --table-border: ${t.border};
      --accent: ${t.accent};
      --color-note: ${t.blue};
      --color-tip: ${t.green};
      --color-warning: ${t.yellow};
      --color-caution: ${t.red};
      --color-important: ${t.magenta};
      --color-h1: ${t.bBlue};
      --color-h2: ${t.bMagenta};
      --color-h3: ${t.bCyan};
      --color-h4: ${t.accent};
      --color-h5: ${t.bGreen};
      --color-h6: ${t.muted};
    }
    body, #content {
      font-family: "Ubuntu Sans", "Segoe UI", Arial, freesans, sans-serif;
      background: var(--bg);
      color: var(--fg);
    }
    #content h1 { color: var(--color-h1); }
    #content h2 { color: var(--color-h2); }
    #content h3 { color: var(--color-h3); }
    #content h4 { color: var(--color-h4); }
    #content h5 { color: var(--color-h5); }
    #content h6 { color: var(--color-h6); }
    #content strong { color: var(--accent); }
    #content em { color: ${t.red}; }
    #content a:hover { color: ${t.red}; }
    #content code { color: ${t.magenta}; }
    #content pre code { color: var(--fg); }
    #content blockquote { background: var(--panel); border-radius: 3px; }
  '';

  # Firefox chrome UI. Applied via a static userChrome.css that only
  # @imports active-theme.css (flipped by theme-switch). Firefox reads
  # chrome at startup, so a restart applies the switch. Kept to chrome
  # UI on purpose; web content theming is out of scope.
  mkFirefox = t: ''
    /* Generated by den.aspects.theme for ${t.label} */
    :root {
      --bg: ${t.bg} !important;
      --surface: ${t.surface} !important;
      --surface2: ${t.surface2} !important;
      --fg: ${t.fg} !important;
      --muted: ${t.muted} !important;
      --accent: ${t.accent} !important;
      --accent-fg: ${t.accentFg} !important;
      --border: ${t.border} !important;
      --toolbar-bgcolor: ${t.bg} !important;
      --toolbar-color: ${t.fg} !important;
      --lwt-accent-color: ${t.bg} !important;
      --lwt-text-color: ${t.fg} !important;
      --toolbar-field-background-color: ${t.surface} !important;
      --toolbar-field-color: ${t.fg} !important;
      --toolbar-field-border-color: ${t.border} !important;
      --toolbar-field-focus-background-color: ${t.surface} !important;
      --toolbar-field-focus-border-color: ${t.accent} !important;
      --tab-selected-bgcolor: ${t.surface2} !important;
      --tab-selected-textcolor: ${t.fg} !important;
      --button-background-color: ${t.surface2} !important;
      --button-background-color-hover: ${t.accent} !important;
      --link-color: ${t.blue} !important;
    }
    #navigator-toolbox { background: ${t.bg} !important; border-bottom: 1px solid ${t.border} !important; }
    #TabsToolbar { background: ${t.bg} !important; }
    .tabbrowser-tab .tab-background { background: transparent !important; }
    .tabbrowser-tab[selected] .tab-background { background: ${t.surface2} !important; }
    .tabbrowser-tab:not([selected]):hover .tab-background { background: ${t.surface} !important; }
    .tabbrowser-tab .tab-label { color: ${t.muted} !important; }
    .tabbrowser-tab[selected] .tab-label { color: ${t.fg} !important; }
    #urlbar-background { background: ${t.surface} !important; border-color: ${t.border} !important; }
    #urlbar[focused] #urlbar-background { border-color: ${t.accent} !important; }
    #sidebar-box, #sidebar { background: ${t.bg} !important; color: ${t.fg} !important; }
    menupopup, panel { --panel-background: ${t.surface} !important; --panel-color: ${t.fg} !important; }
  '';

  mkNoctaliaPalette = t: ''
    {
      "dark": {
        "mPrimary": "${t.accent}",
        "mOnPrimary": "${t.accentFg}",
        "mSecondary": "${t.green}",
        "mOnSecondary": "${t.accentFg}",
        "mTertiary": "${t.magenta}",
        "mOnTertiary": "${t.accentFg}",
        "mError": "${t.red}",
        "mOnError": "${t.accentFg}",
        "mSurface": "${t.bg}",
        "mOnSurface": "${t.fg}",
        "mSurfaceVariant": "${t.surface}",
        "mOnSurfaceVariant": "${t.fg}",
        "mOutline": "${t.border}",
        "mShadow": "${t.bgDark}",
        "mHover": "${t.accent}",
        "mOnHover": "${t.accentFg}",
        "terminal": {
          "foreground": "${t.fg}",
          "background": "${t.bg}",
          "selectionFg": "${t.accentFg}",
          "selectionBg": "${t.selection}",
          "cursorText": "${t.accentFg}",
          "cursor": "${t.cursor}",
          "normal": {
            "black": "${t.black}",
            "red": "${t.red}",
            "green": "${t.green}",
            "yellow": "${t.yellow}",
            "blue": "${t.blue}",
            "magenta": "${t.magenta}",
            "cyan": "${t.cyan}",
            "white": "${t.white}"
          },
          "bright": {
            "black": "${t.bBlack}",
            "red": "${t.bRed}",
            "green": "${t.bGreen}",
            "yellow": "${t.bYellow}",
            "blue": "${t.bBlue}",
            "magenta": "${t.bMagenta}",
            "cyan": "${t.bCyan}",
            "white": "${t.bWhite}"
          }
        }
      },
      "light": {
        "mPrimary": "${t.accent}",
        "mOnPrimary": "${t.accentFg}",
        "mSecondary": "${t.green}",
        "mOnSecondary": "${t.accentFg}",
        "mTertiary": "${t.magenta}",
        "mOnTertiary": "${t.accentFg}",
        "mError": "${t.red}",
        "mOnError": "${t.accentFg}",
        "mSurface": "${t.bg}",
        "mOnSurface": "${t.fg}",
        "mSurfaceVariant": "${t.surface}",
        "mOnSurfaceVariant": "${t.fg}",
        "mOutline": "${t.border}",
        "mShadow": "${t.bgDark}",
        "mHover": "${t.accent}",
        "mOnHover": "${t.accentFg}",
        "terminal": {
          "foreground": "${t.fg}",
          "background": "${t.bg}",
          "selectionFg": "${t.accentFg}",
          "selectionBg": "${t.selection}",
          "cursorText": "${t.accentFg}",
          "cursor": "${t.cursor}",
          "normal": {
            "black": "${t.black}",
            "red": "${t.red}",
            "green": "${t.green}",
            "yellow": "${t.yellow}",
            "blue": "${t.blue}",
            "magenta": "${t.magenta}",
            "cyan": "${t.cyan}",
            "white": "${t.white}"
          },
          "bright": {
            "black": "${t.bBlack}",
            "red": "${t.bRed}",
            "green": "${t.bGreen}",
            "yellow": "${t.bYellow}",
            "blue": "${t.bBlue}",
            "magenta": "${t.bMagenta}",
            "cyan": "${t.bCyan}",
            "white": "${t.bWhite}"
          }
        }
      }
    }
  '';

  themesList = lib.concatStringsSep "\n"
    (map (slug: "${slug}\t${themes.${slug}.label}") themeNames) + "\n";

  # Per-slug shell case maps used by theme-switch + activation
  kvMap = lib.concatStringsSep "\n"
    (map (slug: "      ${slug}) printf '%s' \"${themes.${slug}.kvantumTheme}\";;") themeNames);
  palMap = lib.concatStringsSep "\n"
    (map (slug: "      ${slug}) printf '%s' \"${themes.${slug}.noctaliaPalette}\";;") themeNames);
  doomMap = lib.concatStringsSep "\n"
    (map (slug: "      ${slug}) printf '%s' \"${themes.${slug}.doomTheme}\";;") themeNames);
  polMap = lib.concatStringsSep "\n"
    (map (slug: "      ${slug}) printf '%s' \"${themes.${slug}.polarity}\";;") themeNames);
in
{
  den.aspects.theme = {
    nixos = { pkgs, ... }: {
      programs.dconf.enable = true;
      environment.systemPackages = with pkgs; [
        qt6Packages.qt6ct
        libsForQt5.qtstyleplugin-kvantum
        qt6Packages.qtstyleplugin-kvantum
      ];
    };

    homeManager = { config, lib, pkgs, ... }:
      let
        homeDir = config.home.homeDirectory;
        themeSwitch = pkgs.writeShellScriptBin "theme-switch" ''
          set -euo pipefail
          THEME_DIR="$HOME/.config/mytheme"
          CURRENT="$THEME_DIR/current"
          LIST="$THEME_DIR/themes.list"
          kv_of() { case "$1" in
          ${kvMap}
            *) printf '%s' "Gruvbox";;
          esac }
          pal_of() { case "$1" in
          ${palMap}
            *) printf '%s' "GruvboxMain";;
          esac }
          pol_of() { case "$1" in
          ${polMap}
            *) printf '%s' "dark";;
          esac }
          if [ $# -lt 1 ]; then
            echo "Usage: theme-switch <theme> [--list]"
            echo "Available:"
            cut -f1,2 "$LIST" 2>/dev/null || true
            exit 1
          fi
          if [ "$1" = "--list" ] || [ "$1" = "-l" ]; then
            cut -f1,2 "$LIST"
            exit 0
          fi
          SEL="$1"
          if ! grep -q "^$SEL"$'\t' "$LIST"; then
            echo "Unknown theme: $SEL" >&2
            cut -f1 "$LIST" >&2 || true
            exit 1
          fi
          mkdir -p "$THEME_DIR"
          printf '%s\n' "$SEL" > "$CURRENT"
          S="$THEME_DIR/themes/$SEL"
          linkf() {
            mkdir -p "$(dirname "$2")"
            if [ -e "$2" ] && [ ! -L "$2" ]; then mv "$2" "$2.pre-theme-switch-bak"; fi
            ln -sfn "$1" "$2"
          }
          # Idempotent INI key setter (python-free): adds section/key or
          # replaces the value, preserving everything else in the file.
          ini_set() {
            awk -v sec="[$2]" -v key="$3" -v val="$4" '
              BEGIN { insec = 0; done = 0 }
              /^\[/ {
                if (insec && !done) { print key"="val; done = 1 }
                insec = ($0 == sec)
              }
              insec && !done && /^[^=]+=.*/ {
                split($0, kv, "=")
                if (kv[1] == key) { print key"="val; done = 1; next }
              }
              { print }
              END {
                if (!done) {
                  if (!insec) print sec
                  print key"="val
                }
              }
            ' "$1" > "$1.tmp" && mv "$1.tmp" "$1"
          }
          linkf "$S/kitty-theme.conf" "$HOME/.config/kitty/theme.conf"
          linkf "$S/ghostty-theme" "$HOME/.config/ghostty/theme.ghostty"
          linkf "$S/hypr-theme.lua" "$HOME/.config/hypr/theme.lua"
          linkf "$S/nvim-colors.lua" "$HOME/.config/nvim/lua/plugins/colors.lua"
          linkf "$S/doom-style.el" "$HOME/.config/doom/style.el"
          linkf "$S/neomark.css" "$HOME/.config/neomark/markdown.css"
          linkf "$S/ohmyposh.toml" "$HOME/.config/ohmyposh/active.toml"
          linkf "$S/fzf-theme.zsh" "$HOME/.config/fzf/theme.zsh"
          linkf "$S/yazi-theme.toml" "$HOME/.config/yazi/theme.toml"
          linkf "$S/gtk.css" "$HOME/.config/gtk-3.0/gtk.css"
          linkf "$S/gtk.css" "$HOME/.config/gtk-4.0/gtk.css"
          linkf "$S/firefox-chrome.css" "$HOME/.config/mozilla/firefox/nix/chrome/active-theme.css"
          # Noctalia: all palettes are installed; point settings at this one
          PAL="$(pal_of "$SEL")"
          if [ -f "$HOME/.config/noctalia/settings.toml" ] && [ ! -L "$HOME/.config/noctalia/settings.toml" ]; then
            if grep -q '^custom_palette' "$HOME/.config/noctalia/settings.toml"; then
              sed -i "s/^custom_palette.*/custom_palette = \"$PAL\"/" "$HOME/.config/noctalia/settings.toml"
            else
              printf '\ncustom_palette = "%s"\n' "$PAL" >> "$HOME/.config/noctalia/settings.toml"
            fi
          fi
          mkdir -p "$HOME/.config/noctalia/palettes"
          cp -f "$S/noctalia-palette.json" "$HOME/.config/noctalia/palettes/$PAL.json"
          # Also (re)install every palette so the Noctalia picker sees all of them
          for d in "$THEME_DIR"/themes/*/; do
            slug2="$(basename "$d")"
            pal2="$(pal_of "$slug2")"
            if [ -n "$pal2" ] && [ -f "$d/noctalia-palette.json" ]; then
              cp -f "$d/noctalia-palette.json" "$HOME/.config/noctalia/palettes/$pal2.json" 2>/dev/null || true
            fi
          done
          # Kvantum: standalone themes are installed; select this one.
          # The manager rewrites kvantum.kvconfig itself, so enforce our
          # value afterwards (also repairs a clobbered file).
          KV="$(kv_of "$SEL")"
          mkdir -p "$HOME/.config/Kvantum"
          if command -v kvantummanager >/dev/null 2>&1; then timeout 15 kvantummanager --set "$KV" >/dev/null 2>&1 || true; fi
          if [ -L "$HOME/.config/Kvantum/kvantum.kvconfig" ]; then rm -f "$HOME/.config/Kvantum/kvantum.kvconfig"; fi
          if [ -f "$HOME/.config/Kvantum/kvantum.kvconfig" ]; then
            if grep -q '^theme=' "$HOME/.config/Kvantum/kvantum.kvconfig"; then
              sed -i "s/^theme=.*/theme=$KV/" "$HOME/.config/Kvantum/kvantum.kvconfig"
            else
              printf 'theme=%s\n' "$KV" >> "$HOME/.config/Kvantum/kvantum.kvconfig"
            fi
          else
            printf '[General]\ntheme=%s\n' "$KV" > "$HOME/.config/Kvantum/kvantum.kvconfig"
          fi
          # KDE color scheme (kdeglobals): Dolphin/file dialogs follow
          # KColorScheme, which nothing else refreshes (stale TokyoNight
          # values were the dark-text culprit). Converge the color sections
          # from the palette; everything else in the file is preserved.
          # NOTE: running KDE apps re-read on restart.
          if [ -f "$S/kde-colors.env" ]; then
            # shellcheck disable=SC1090
            . "$S/kde-colors.env"
            KG="$HOME/.config/kdeglobals"
            if [ ! -e "$KG" ]; then
              mkdir -p "$(dirname "$KG")"
              printf '[General]\n' > "$KG"
            fi
            if [ -f "$KG" ] && [ ! -L "$KG" ]; then
              for sec in "Colors:View" "Colors:Window" "Colors:Header" "Colors:Complementary"; do
                ini_set "$KG" "$sec" BackgroundNormal "$VIEW_BG"
                ini_set "$KG" "$sec" BackgroundAlternate "$VIEW_BG_ALT"
                ini_set "$KG" "$sec" ForegroundNormal "$VIEW_FG"
                ini_set "$KG" "$sec" ForegroundInactive "$VIEW_FG_DIM"
                ini_set "$KG" "$sec" DecorationFocus "$ACCENT"
                ini_set "$KG" "$sec" DecorationHover "$ACCENT"
              done
              for sec in "Colors:Button" "Colors:Tooltip"; do
                ini_set "$KG" "$sec" BackgroundNormal "$SURFACE2"
                ini_set "$KG" "$sec" BackgroundAlternate "$SURFACE"
                ini_set "$KG" "$sec" ForegroundNormal "$VIEW_FG"
                ini_set "$KG" "$sec" ForegroundInactive "$VIEW_FG_DIM"
              done
              ini_set "$KG" "Colors:Selection" BackgroundNormal "$ACCENT"
              ini_set "$KG" "Colors:Selection" BackgroundAlternate "$ACCENT"
              ini_set "$KG" "Colors:Selection" ForegroundNormal "$ACCENT_FG"
              ini_set "$KG" "Colors:Selection" ForegroundInactive "$ACCENT_FG"
            fi
          fi
          # GTK color-scheme via dconf (schema-free writes; gsettings kept
          # as best-effort fallback for sessions where schemas exist).
          # Theme name stays adw-gtk3, the per-theme gtk.css carries color.
          POL="$(pol_of "$SEL")"
          if command -v dconf >/dev/null 2>&1; then
            dconf write /org/gnome/desktop/interface/color-scheme "'prefer-$POL'" >/dev/null 2>&1 || true
            dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'" >/dev/null 2>&1 || true
          fi
          if command -v gsettings >/dev/null 2>&1; then
            gsettings set org.gnome.desktop.interface color-scheme "prefer-$POL" >/dev/null 2>&1 || true
            gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3" >/dev/null 2>&1 || true
          fi
          # Live reloads (best effort, never fail or hang the switch)
          if command -v hyprctl >/dev/null 2>&1; then timeout 10 hyprctl reload >/dev/null 2>&1 || true; fi
          if command -v kitten >/dev/null 2>&1; then
            for sock in "''${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"/kitty-*; do
              [ -S "$sock" ] || continue
              timeout 10 kitten @ --to "unix:$sock" set-colors --all "$S/kitty-theme.conf" >/dev/null 2>&1 || true
            done
          fi
          if command -v noctalia >/dev/null 2>&1; then timeout 15 noctalia msg reload >/dev/null 2>&1 || true; fi
          if command -v emacsclient >/dev/null 2>&1; then
            timeout 15 emacsclient -e '(progn (load-file "~/.config/doom/style.el") (when (boundp (quote doom-theme)) (load-theme doom-theme t)))' >/dev/null 2>&1 || true
          fi
          echo "Theme: $SEL ($PAL / $KV). New shells/panes pick up shell+editor themes; running Neovim/Emacs may need :colorscheme reload or restart."
        '';
      in
      {
        home.packages = with pkgs; [
          themeSwitch
          qt6Packages.qt6ct
          glib
        ];

        # Static shell: fonts, cursor, icons (no Stylix needed for these)
        home.pointerCursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
          size = 18;
          enable = true;
          gtk.enable = true;
          x11.enable = true;
        };

        gtk = {
          enable = true;
          theme = {
            package = pkgs.adw-gtk3;
            name = "adw-gtk3";
          };
          iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
          };
          cursorTheme = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Ice";
            size = 18;
          };
          font = {
            package = pkgs.ubuntu-sans;
            name = "Ubuntu Sans";
            size = 12;
          };
        };
        dconf.settings = {
          "org/gnome/desktop/interface" = {
            gtk-theme = "adw-gtk3";
            icon-theme = "Papirus-Dark";
            cursor-theme = "Bibata-Modern-Ice";
            font-name = "Ubuntu Sans 12";
            color-scheme = "prefer-dark";
          };
        };

        # Qt6 via Kvantum, managed manually (NOT via HM qt module, so this
        # file never fights another module). Theme itself switches at runtime.
        home.sessionVariables = {
          QT_QPA_PLATFORMTHEME = "qtct";
          QT_STYLE_OVERRIDE = "kvantum";
        };
        # Wallpaper daemon (migrated from stylix aspect)
        services.awww.enable = true;

        # Kitty static shell; colors come from included theme.conf at runtime
        programs.kitty = {
          enable = true;
          font = {
            name = "FiraCodeNerdFont";
            size = 14;
          };
          settings = {
            background_opacity = 0.9;
            allow_remote_control = "socket-only";
            listen_on = "unix:$XDG_RUNTIME_DIR/kitty-{kitty_pid}";
          };
          extraConfig = ''
            include ${homeDir}/.config/kitty/theme.conf
            bold_font auto
            italic_font "Cascadia Code NF"
            bold_italic_font "Cascadia Code NF"
          '';
        };

        # Hyprland runtime theme: sourced after generated config
        wayland.windowManager.hyprland.extraConfig = lib.mkAfter ''
          require("theme")
        '';

        # NOTE: Firefox chrome is managed natively via
        # programs.firefox.profiles.nix.userChrome (see packages.nix),
        # which writes the static @import shim. Only active-theme.css is
        # flipped here; never manage userChrome.css from this side.

        # Theme store: every theme × every app, built once, switched via symlinks
        xdg.configFile = lib.mkMerge [
          {
            "qt6ct/qt6ct.conf".text = ''
              [Appearance]
              custom_palette=true
              icon_theme=Papirus-Dark
              standard_dialogs=default
              style=kvantum
              [Fonts]
              fixed="FiraCode Nerd Font,12"
              general="Ubuntu Sans,12"
            '';
            # pcmanfm-qt/libfm-qt read the LXQt icon theme (not qt6ct),
            # so set it explicitly. breeze exists as fallback.
            "lxqt/lxqt.conf".text = ''
              [General]
              icon_theme=Papirus-Dark
            '';
          }
          (lib.concatMapAttrs
            (slug: t: {
              "mytheme/themes/${slug}/kitty-theme.conf".text = mkKitty t;
              "mytheme/themes/${slug}/ghostty-theme".text = mkGhostty t;
              "mytheme/themes/${slug}/hypr-theme.lua".text = mkHyprLua t;
              "mytheme/themes/${slug}/gtk.css".text = mkGtkCss t;
              "mytheme/themes/${slug}/ohmyposh.toml".text = mkOmp t;
              "mytheme/themes/${slug}/nvim-colors.lua".text = mkNvimColors t;
              "mytheme/themes/${slug}/doom-style.el".text = mkDoomStyle t;
              "mytheme/themes/${slug}/yazi-theme.toml".text = mkYazi t;
              "mytheme/themes/${slug}/fzf-theme.zsh".text = mkFzf t;
              "mytheme/themes/${slug}/neomark.css".text = mkNeomark t;
              "mytheme/themes/${slug}/firefox-chrome.css".text = mkFirefox t;
              "mytheme/themes/${slug}/noctalia-palette.json".text = mkNoctaliaPalette t;
              "mytheme/themes/${slug}/kde-colors.env".text = mkKdeEnv t;
              "Kvantum/${t.kvantumTheme}/${t.kvantumTheme}.kvconfig".text = mkKvconfig t;
              "Kvantum/${t.kvantumTheme}/${t.kvantumTheme}.svg".text = mkSvg t;
            })
            themes)
          { "mytheme/themes.list".text = themesList; }
        ];

        home.activation.mytheme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          THEME_DIR="$HOME/.config/mytheme"
          CURRENT="$THEME_DIR/current"
          mkdir -p "$THEME_DIR"
          if [ ! -f "$CURRENT" ]; then printf '%s\n' "${defaultTheme}" > "$CURRENT"; fi
          SEL="$(cat "$CURRENT")"
          if [ ! -d "$THEME_DIR/themes/$SEL" ]; then SEL="${defaultTheme}"; printf '%s\n' "${defaultTheme}" > "$CURRENT"; fi
          # Seed unmanaged dirs on first run. Seeding keys off sentinel FILES
          # (not dir shape) and uses cp -n: a real-but-incomplete dir after
          # dropping old whole-dir symlinks still gets its missing files,
          # while user customizations are never clobbered.
          if [ -L "$HOME/.config/doom" ]; then
            rm "$HOME/.config/doom"
          fi
          mkdir -p "$HOME/.config/doom"
          cp -ran "${inputs.dotfiles}/common/doom/." "$HOME/.config/doom/"
          chmod -R u+w "$HOME/.config/doom"
          if [ -L "$HOME/.config/noctalia" ]; then
            rm "$HOME/.config/noctalia"
          fi
          if [ ! -f "$HOME/.config/noctalia/settings.toml" ]; then
            mkdir -p "$HOME/.config/noctalia"
            cp -a "${inputs.dotfiles}/gruvbox/noctalia/settings.toml" "$HOME/.config/noctalia/settings.toml"
            chmod -R u+w "$HOME/.config/noctalia"
          fi
          if [ ! -d "$HOME/.config/noctalia/templates" ]; then
            mkdir -p "$HOME/.config/noctalia"
            cp -a "${inputs.dotfiles}/gruvbox/noctalia/templates" "$HOME/.config/noctalia/templates"
            chmod -R u+w "$HOME/.config/noctalia"
          fi
          if [ ! -d "$HOME/.config/noctalia/community-templates" ]; then
            cp -a "${inputs.dotfiles}/gruvbox/noctalia/community-templates" "$HOME/.config/noctalia/community-templates" 2>/dev/null || true
            chmod -R u+w "$HOME/.config/noctalia" 2>/dev/null || true
          fi
          mkdir -p "$HOME/.config/noctalia/palettes"
          if [ -L "$HOME/.config/ohmyposh" ]; then
            rm "$HOME/.config/ohmyposh"
          fi
          mkdir -p "$HOME/.config/ohmyposh"
          cp -ran "${inputs.dotfiles}/ohmyposh/." "$HOME/.config/ohmyposh/" 2>/dev/null || true
          chmod -R u+w "$HOME/.config/ohmyposh" 2>/dev/null || true
          mkdir -p "$HOME/.config/ohmyposh" "$HOME/.config/fzf"
          # Converge to the selected theme using the just-built switcher
          # (store path: works even though the new profile is not live yet).
          # Falls back to plain symlink convergence if the switcher fails.
          if ! "${themeSwitch}/bin/theme-switch" "$SEL" >/dev/null 2>&1; then
          S="$THEME_DIR/themes/$SEL"
          for pair in \
            "$S/kitty-theme.conf:$HOME/.config/kitty/theme.conf" \
            "$S/ghostty-theme:$HOME/.config/ghostty/theme.ghostty" \
            "$S/hypr-theme.lua:$HOME/.config/hypr/theme.lua" \
            "$S/nvim-colors.lua:$HOME/.config/nvim/lua/plugins/colors.lua" \
            "$S/doom-style.el:$HOME/.config/doom/style.el" \
            "$S/neomark.css:$HOME/.config/neomark/markdown.css" \
            "$S/ohmyposh.toml:$HOME/.config/ohmyposh/active.toml" \
            "$S/fzf-theme.zsh:$HOME/.config/fzf/theme.zsh" \
            "$S/yazi-theme.toml:$HOME/.config/yazi/theme.toml" \
            "$S/gtk.css:$HOME/.config/gtk-3.0/gtk.css" \
            "$S/gtk.css:$HOME/.config/gtk-4.0/gtk.css" \
            "$S/firefox-chrome.css:$HOME/.config/mozilla/firefox/nix/chrome/active-theme.css"; do
            src="''${pair%%:*}"; dst="''${pair#*:}"
            mkdir -p "$(dirname "$dst")"
            if [ -e "$dst" ] && [ ! -L "$dst" ]; then mv "$dst" "$dst.pre-theme-switch-bak"; fi
            ln -sfn "$src" "$dst"
          done
          fi
        '';
      };
  };
}
