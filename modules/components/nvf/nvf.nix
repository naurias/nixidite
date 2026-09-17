{ neo, inputs, ... }:
{
  # DORMANT (kept intentionally, see note below). To re-enable, add
  # `neo.nvf` back to `den.aspects.components` includes AND resolve the
  # collision first: `neo.nvf.provides.plugins` writes
  # `.config/neomark/markdown.css`, which is owned by `den.aspects.theme`
  # (runtime symlink, see `theme-switch`). Move that file into the theme
  # store before enabling.
  neo.nvf = {
    includes = [
      neo.nvf._.languages
      neo.nvf._.plugins
      neo.nvf._.keybinds
    ];
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        imports = [ inputs.nvf.homeManagerModules.default ];
        programs.nvf = {
          enable = true;
          settings.vim = {
            enableLuaLoader = true;
            globals = {
              #mkdp_markdown_css = "/home/nix/nixidite/modules/components/nvf/markdown.css";
            };
            theme = {
              enable = true;
              name = "gruvbox";
              style = "dark";
            };
            options = {
              tabstop = 2;
              shiftwidth = 2;
            };
          };
        };
      };
  };
}
