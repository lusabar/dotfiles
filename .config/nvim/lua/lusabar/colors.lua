-- Select colorscheme

function color_everything(color)
   color = color or "default"
   vim.cmd.colorscheme(color)

   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

color_everything("lavender")
