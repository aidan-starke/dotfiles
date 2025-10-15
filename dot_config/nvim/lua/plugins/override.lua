return {
  {
    "Exafunction/codeium.nvim",
    opts = {
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        manual = false,
        idle_delay = 75,
        key_bindings = {
          accept = "<Tab>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        focus = "list",
        sources = {
          select = {
            focus = "input",
          },
          explorer = {
            hidden = true,
            ignored = true,
            auto_close = true,
          },
          files = {
            hidden = true,
            ignored = true,
            focus = "input",
          },
          grep = {
            focus = "input",
          },
          config = {
            focus = "input",
          },
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern(
              "eslint.config.js",
              "eslint.config.mjs",
              "eslint.config.cjs",
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json",
              ".eslintrc"
            )(fname)
          end,
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
        sql = { "sqlfluff" },
      },
      formatters = {
        csharpier = {
          command = "csharpier",
          args = { "format", "--write-stdout" },
        },
        sqlfluff = {
          args = { "format", "--dialect=sqlite", "-" },
        },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Make sure sql is NOT here, or is empty
        sql = {}, -- No linters for SQL
      },
    },
  },
}
