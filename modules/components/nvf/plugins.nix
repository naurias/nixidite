{ neo, ... }:
{
  neo.nvf.provides.plugins = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        programs.nvf.settings.vim = {
          binds.whichKey.enable = true;
          mini.pairs.enable = true;
          utility.motion.flash-nvim.enable = true;
          utility.preview.markdownPreview.enable = true;
          git.gitsigns = {
            enable = true;
            codeActions.enable = true;
          };
          lsp.trouble.enable = true;
          notes.todo-comments.enable = true;
          tabline.nvimBufferline.enable = true;
          ui.noice.enable = true;
          mini.icons.enable = true;
          utility.snacks-nvim = {
            enable = true;
            setupOpts = {
              picker = {
                enabled = true;
              };
              explorer = {
                enabled = true;
              };
              bigfile = {
                enabled = true;
              };
              debug = {
                enabled = true;
              };
              indent = {
                enabled = true;
              };
              image = {
                enabled = true;
              };
              notifier = {
                enabled = true;
              };
              scratch = {
                enabled = true;
              };
              statuscolumn = {
                enabled = false;
              };
              quickfile = {
                enabled = true;
              };
            };
          };
          snippets.luasnip.enable = true;
          mini.comment.enable = true;
          mini.snippets.enable = true;
          mini.surround.enable = true;
          debugger.nvim-dap.enable = true;
          debugger.nvim-dap.ui.enable = true;
          utility.outline.aerial-nvim.enable = true;
          fzf-lua.enable = true;
          statusline.lualine.enable = true;
          autocomplete.blink-cmp.enable = true;
          extraPlugins = with pkgs.vimPlugins; {
            nui-nvim = {
              package = nui-nvim;
            };
          };
          startPlugins = [
            pkgs.vimPlugins.ts-comments-nvim
            pkgs.vimPlugins.grug-far-nvim
          ];
        };
      };
  };
}
