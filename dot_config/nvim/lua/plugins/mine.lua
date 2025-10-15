return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "phaazon/hop.nvim", event = "VeryLazy" }, -- Hop to a character

  { "MeanderingProgrammer/render-markdown.nvim", ft = "markdown" }, -- Render markdown

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  }, -- Edit surrounding brackets/quotes/tags

  {
    "gcmt/wildfire.vim",
    event = "VeryLazy",
  }, -- Smart selection

  { "tpope/vim-sleuth" }, -- Auto-detect indentation
}
