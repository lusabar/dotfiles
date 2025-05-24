return {
   "nvim-telescope/telescope.nvim",
   tag = "0.1.8",
   dependencies = { "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
      "nvim-tree/nvim-web-devicons",
   },

   config = function()
      require('telescope').setup({
         extensions = {
            fzf = {}
         }
      })

      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope [f]ind [f]iles' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live [g]rep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope [b]uffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope [h]elp tags' })
      vim.keymap.set('n', '<leader>fa',
         function()
            builtin.find_files {
               no_ignore = true
            }
         end,
         { desc = 'Telescope [f]ind [a]ll files' })
      vim.keymap.set('n', '<leader>f~',
         function()
            builtin.find_files {
               no_ignore = true,
               hidden = true,
               cwd = "$HOME"
            }
         end,
         { desc = 'Telescope [f]ind all files in [~]' })
   end
}
