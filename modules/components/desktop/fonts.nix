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
        fonts.packages = with pkgs; [
          maple-mono.NF-unhinted
          ubuntu-sans
          nerd-fonts.symbols-only
          nerd-fonts.fira-code
          cascadia-code
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
        home.packages = with pkgs; [
          nerd-fonts.fira-code
          font-manager
          font-awesome_5
          noto-fonts
        ];
      };
  };
}
