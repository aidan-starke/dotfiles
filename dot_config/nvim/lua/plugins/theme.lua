return {
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, c)
        hl["@keyword"] = { fg = c.blue5 }
        hl["@comment"] = { fg = "#636da6" }

        hl.LineNr = { fg = c.blue, bg = "none" }
        hl.LineNrAbove = { fg = c.blue0, bg = "none" }
        hl.LineNrBelow = { fg = c.blue0, bg = "none" }
        hl.CursorLineNr = { fg = c.orange, bold = true, bg = "none" }
        hl.SignColumn = { bg = "none" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
