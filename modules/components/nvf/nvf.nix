{ neo, inputs, ... }:
{
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
              mkdp_markdown_css = "/home/nix/nixidite/modules/components/nvf/markdown.css";
            };
            theme = {
              enable = true;
              name = "rose-pine";
              style = "main";
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
