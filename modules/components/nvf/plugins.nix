{ neo, inputs, ... }:
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
        home.packages = [
          inputs.mermaid-rs-renderer.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
        programs.nvf.settings.vim = {
          #custom plugins
          binds.whichKey.enable = true;
          mini.pairs.enable = true;
          utility.motion.flash-nvim.enable = true;
          utility.preview.markdownPreview.enable = false;
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
            # custom plugins
            live-server-nvim = {
              package = pkgs.vimUtils.buildVimPlugin {
                pname = "live-server-nvim";
                version = "0-unstable-${inputs.live-server-nvim.lastModifiedDate or "unknown"}";
                src = inputs.live-server-nvim;
              };
            };
            mardown-preview-nvim = {
              package = pkgs.vimUtils.buildVimPlugin {
                pname = "markdown-preview-nvim";
                version = "0-unstable-${inputs.mardown-preview-nvim.lastModifiedDate or "unknown"}";
                src = inputs.mardown-preview-nvim;
                nvimSkipModules = [ "markdown_preview" ];
              };
              setup = ''
                require("markdown_preview").setup({
                  instance_mode = "takeover",
                  port = 0,
                  host = "127.0.0.1",
                  open_browser = true,
                  browser = nil,
                  custom_css = "~/nixidite/modules/components/nvf/markdown.css",
                  workspace_dir = nil,
                  overwrite_index_on_start = true,
                  auto_refresh = true,
                  auto_refresh_events = {
                    "InsertLeave",
                    "TextChanged",
                    "TextChangedI",
                    "BufWritePost",
                  },
                  debounce_ms = 300,
                  notify_on_refresh = false,
                  mermaid_renderer = "rust",
                  default_theme = "dark",
                  yaml_mode = "panel",
                  allow_raw_html = true,
                  scroll_sync = true,
                  bottom_padding = 0.5,
                })

              '';
            };
            # nixpkgs plugins
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
