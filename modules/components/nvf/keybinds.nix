{ neo, ... }:
{
  neo.nvf.provides.keybinds = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        programs.nvf.settings.vim = {
          lsp.mappings = {
            format = "<leader>cf";
            codeAction = "<leader>ca";
            documentHighlight = "<leader>uH";
            goToDeclaration = "<leader>lgD";
            goToDefinition = "<leader>lgd";
            goToType = "<leader>lgt";
          };
          tabline.nvimBufferline.mappings = {
            cycleNext = "<leader>b]";
            cyclePrevious = "<leader>b[";
            moveNext = "<leader>b}";
            movePrevious = "<leader>b{";
            pick = "<leader>bj";
          };
          keymaps = [
            {
              key = "<leader><tab>[";
              mode = "n";
              action = "<cmd>tabprevious<cr>";
              desc = "Previous Tab";
            }

            {
              key = "<leader><tab>d";
              mode = "n";
              action = "<cmd>tabclose<cr>";
              desc = "Close Tab";
            }

            {
              key = "<leader><tab>]";
              mode = "n";
              action = "<cmd>tabnext<cr>";
              desc = "Next Tab";
            }

            {
              key = "<leader><tab><tab>";
              mode = "n";
              action = "<cmd>tabnew<cr>";
              desc = "New Tab";
            }

            {
              key = "<leader><tab>o";
              mode = "n";
              action = "<cmd>tabonly<cr>";
              desc = "Close Other Tabs";
            }

            {
              key = "<leader>wd";
              mode = "n";
              action = "<C-W>c";
              desc = "Delete Window";
            }

            {
              key = "<leader>wsv";
              mode = "n";
              action = "<C-W>v";
              desc = "Split Window Vertically";
            }

            {
              key = "<leader>wsh";
              mode = "n";
              action = "<C-W>s";
              desc = "Split Window Horizontally";
            }

            {
              key = "<leader>oT";
              mode = "n";
              action = ":lua Snacks.terminal()<cr>";
              desc = "Open Terminal (cwd)";
            }

            {
              key = "<leader>ot";
              mode = "n";
              action = ":lua Snacks.terminal(nil, { cwd = LazyVim.root() })<cr>";
              desc = "Open Terminal (root dir)";
            }

            {
              key = "<leader>uI";
              mode = "n";
              action = '':lua vim.treesitter.inspect_tree() vim.api.nvim_input("I") <cr>'';
              desc = "Inspect Tree";
            }

            {
              key = "<leader>ui";
              mode = "n";
              action = "vim.show_pos";
              desc = "Inspect Pos";
            }

            {
              key = "<leader>gG";
              mode = "n";
              action = ":lua Snacks.lazygit( { cwd = LazyVim.root.git() })<cr>";
              desc = "Lazygit RootDir";
            }

            {
              key = "<leader>gg";
              mode = "n";
              action = ":lua Snacks.lazygit()<cr>";
              desc = "Lazygit cwd";
            }

            {
              key = "<leader>gs";
              mode = "n";
              action = ":lua Snacks.picker.git_status()<cr>";
              desc = "Git Status";
            }

            {
              key = "<leader>gD";
              mode = "n";
              action = '':lua Snacks.picker.git_diff({ base = "origin", group = true })<cr>'';
              desc = "Git Diff (origin)";
            }

            {
              key = "<leader>gd";
              mode = "n";
              action = ":lua Snacks.picker.git_diff()<cr>";
              desc = "Git Diff (origin)";
            }

            {
              key = "<leader>ug";
              mode = "n";
              action = ":lua Snacks.toggle.indent()<cr>";
              desc = "Toggle Indent Guides";
            }

            {
              key = "<leader>uT";
              mode = "n";
              action = ":lua Snacks.toggle.treesitter()<cr>";
              desc = "Toggle Treesitter Highlight";
            }

            {
              key = "<leader>fn";
              mode = "n";
              action = "<cmd>enew<cr>";
              desc = "New file";
            }

            {
              key = "<leader>bD";
              mode = "n";
              action = "<cmd>:bd<cr>";
              desc = "Delete Buffer and Window";
            }

            {
              key = "<leader>bo";
              mode = "n";
              action = ":lua Snacks.bufdelete.other()<cr>";
              desc = "Delete Other Buffers";
            }

            {
              key = "<leader>bi";
              mode = "n";
              action = ":lua Snacks.bufdelete.invisible()<cr>";
              desc = "Delete invisible Buffers";
            }

            {
              key = "<leader>bd";
              mode = "n";
              action = ":lua Snacks.bufdelete()<cr>";
              desc = "Delete Buffer";
            }

            {
              key = "<leader>bb";
              mode = "n";
              action = "<cmd>e #<cr>";
              desc = "Switch to Other Buffer";
            }

            {
              key = "<leader>bl";
              mode = "n";
              action = "<cmd>BufferLineCloseLeft<cr>";
              desc = "Delete Buffers to the Left";
            }

            {
              key = "<leader>br";
              mode = "n";
              action = "<cmd>BufferLineCloseRight<cr>";
              desc = "Delete Buffers to the Right";
            }

            {
              key = "<leader>bp";
              mode = "n";
              action = "<cmd>BufferLineTogglePin<cr>";
              desc = "Pin Buffer";
            }

            {
              key = "<leader>bP";
              mode = "n";
              action = "<cmd>BufferLineGroupClose ungrouped<cr>";
              desc = "Delete Unpinned Buffers";
            }

            {
              key = "<leader>?";
              mode = "n";
              action = '':lua require("which-key").show({ global = false })<cr>'';
              desc = "Buffer Keymaps WhichKey";
            }

            {
              key = "<leader>fp";
              mode = "n";
              action = ":lua Snacks.picker.projects()<cr>";
              desc = "Projects";
            }

            {
              key = "<leader>fr";
              mode = "n";
              action = ":lua Snacks.picker.recent()<cr>";
              desc = "Recents";
            }

            {
              key = "<leader>fR";
              mode = "n";
              action = ":lua Snacks.picker.recent({ filter = { cwd = true }})<cr>";
              desc = "Recents cwd";
            }

            {
              key = "<leader>fg";
              mode = "n";
              action = ":lua Snacks.picker.git_files()<cr>";
              desc = "Find git files";
            }

            {
              key = "<leader>ff";
              mode = "n";
              action = ":lua Snacks.picker.files()<cr>";
              desc = "Find Files";
            }

            {
              key = "<leader><space>";
              mode = "n";
              action = ":lua Snacks.picker.smart()<cr>";
              desc = "Smart Find files";
            }

            {
              key = "<leader>fb";
              mode = "n";
              action = ":lua Snacks.picker.buffers()<cr>";
              desc = "Find Buffers";
            }

            {
              key = "<leader>fB";
              mode = "n";
              action = ":lua Snacks.picker.buffers({ hidden = true, nofile = true })<cr>";
              desc = "Find All Buffers";
            }

            {
              key = "<leader>/";
              mode = "n";
              action = ":lua Snacks.picker.grep()<cr>";
              desc = "Grep";
            }

            {
              key = "<leader>e";
              mode = "n";
              action = ":lua Snacks.explorer()<cr>";
              desc = "Explorer";
            }

            {
              key = "<leader>sb";
              mode = "n";
              action = ":lua Snacks.picker.lines()<cr>";
              desc = "Bufferlines";
            }

            {
              key = "<leader>sB";
              mode = "n";
              action = ":lua Snacks.picker.grep_buffers()<cr>";
              desc = "Grep Open Buffers";
            }

            {
              key = "<leader>sw";
              mode = "n";
              action = ":lua Snacks.picker.grep_word()<cr>";
              desc = "Grep Word";
            }

            {
              key = "<leader>sC";
              mode = "n";
              action = ":lua Snacks.picker.commands()<cr>";
              desc = "Search Commands";
            }

            {
              key = "<leader>sH";
              mode = "n";
              action = ":lua Snacks.picker.highlights()<cr>";
              desc = "Highlights";
            }

            {
              key = "<leader>sK";
              mode = "n";
              action = ":lua Snacks.picker.keymaps()<cr>";
              desc = "Search keymaps";
            }

            {
              key = "gd";
              mode = "n";
              action = ":lua Snacks.picker.lsp_definitions()<cr>";
              desc = "Go to Definition";
            }

            {
              key = "gD";
              mode = "n";
              action = ":lua Snacks.picker.lsp_declarations()<cr>";
              desc = "Go to Declarations";
            }

            {
              key = "gr";
              mode = "n";
              action = ":lua Snacks.picker.lsp_references()<cr>";
              desc = "Go to Reference";
            }

            {
              key = "gI";
              mode = "n";
              action = ":lua Snacks.picker.lsp_implemetations()<cr>";
              desc = "Go to Implemetation";
            }

            {
              key = "gy";
              mode = "n";
              action = ":lua Snacks.picker.lsp_type_definitions()<cr>";
              desc = "Go to Type";
            }

            {
              key = "<leader>vb";
              mode = "n";
              action = ":lua Snacks.scratch()<cr>";
              desc = "Scractch bffuer";
            }

            {
              key = "<leader>vB";
              mode = "n";
              action = ":lua Snacks.scratch.select()<cr>";
              desc = "Select Scractch bffuer";
            }

            {
              key = "<leader>cR";
              mode = "n";
              action = ":lua Snacks.rename.rename_file()<cr>";
              desc = "Rename File";
            }

          ];
        };
      };
  };
}
