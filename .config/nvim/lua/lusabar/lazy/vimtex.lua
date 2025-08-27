return {
   "lervag/vimtex",
   lazy = false, -- we don't want to lazy load VimTeX
   -- tag = "v2.15", -- uncomment to pin to a specific release
   init = function()
      vim.g.vimtex_mappings_prefix = "<leader>l"

      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_sioyek_options = "--new-window"
      vim.g.vimtex_compiler_method = "latexmk"

      -- Disables syntax highlighting (get it from treesitter instead)
      vim.g.vimtex_syntax_enabled = 0

      -- Single-shot compilation instead of continuous
      vim.keymap.set('n', '<leader>ll', '<plug>(vimtex-compile-ss)', { desc = "[L]aTeX Compi[l]e" })
      vim.keymap.set('n', '<leader>lv', '<plug>(vimtex-view)', { desc = "[L]aTeX [V]iew" })
   end
}
