return {
   "neovim/nvim-lspconfig",
   dependencies = {
      "stevearc/conform.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
   },

   config = function()
      require("lspconfig").lua_ls.setup({})
      require("lspconfig").julials.setup({})
      require("lspconfig").texlab.setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
      })

      -- Autoformatting when file is saved
      vim.api.nvim_create_autocmd('LspAttach', {
         callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then return end

            if client.supports_method('textDocument/formatting', 0) then
               vim.api.nvim_create_autocmd('BufWritePre', {
                  buffer = args.buf,
                  callback = function()
                     vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                  end,
               })
            end
         end
      })
   end
}
