{ de, ... }: {
  de.fonts = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        fonts.fontconfig.enable = true;
        fonts.packages = with pkgs; [
          maple-mono.NF-unhinted
          ubuntu-sans
          nerd-fonts.symbols-only
          nerd-fonts.fira-code
          cascadia-code
          symbola
        ];
      };
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        fonts.fontconfig.enable = true;
        home.packages = with pkgs; [
          nerd-fonts.fira-code
          font-manager
          font-awesome_5
          symbola
          noto-fonts
          ubuntu-sans
          nerd-fonts.symbols-only
          maple-mono.NF-unhinted
          cascadia-code
        ];
      };
  };
}
