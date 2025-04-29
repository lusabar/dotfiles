return {
   "neovim/nvim-lspconfig",
   dependencies = {
      "stevearc/conform.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "L3MON4D3/LuaSnip",
      "j-hui/fidget.nvim",
      "saghen/blink.cmp"
   },

   config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      require("lspconfig").lua_ls.setup({ capabilities = capabilities })
      require("lspconfig").julials.setup({ capabilities = capabilities })
      require("lspconfig").texlab.setup({ capabilities = capabilities })
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
