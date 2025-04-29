--local wk = require("which-key")
return {
   "folke/which-key.nvim",
   event = "VeryLazy",
   opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
   },

   config = function()
      local wk = require("which-key")
      wk.add({
         { vim.g.vimtex_mappings_prefix, group = "[L]aTeX", icon = { icon = "", color = "orange" } }
      })
   end
}
