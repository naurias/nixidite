{ neo, ... }: {
  neo.nvf.provides.languages = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        programs.nvf.settings.vim = {
          lsp = {
            enable = true;
          };
          treesitter = {
            enable = true;
          };

          formatter.conform-nvim = {
            enable = true;
          };
          diagnostics.nvim-lint = {
            enable = true;
          };
          lsp.lspconfig = {
            enable = true;
          };
          languages = {
            enableTreesitter = true;
            enableDAP = true;
            enableFormat = true;
            markdown = {
              enable = true;
              lsp.enable = true;
              treesitter.enable = true;
              format.enable = true;
              extensions.render-markdown-nvim.enable = true;
            };
            yaml = {
              enable = true;
              lsp.enable = true;
              treesitter.enable = true;
              lsp.servers = [ "yaml-language-server" ];
            };
            nix = {
              enable = true;
              format.enable = true;
              format.type = [ "nixfmt" ];
              lsp.enable = true;
              lsp.servers = [ "nixd" ];
              treesitter.enable = true;
            };
          };

        };
      };
  };
}
