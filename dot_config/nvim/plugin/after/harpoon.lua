local ok, harpoon = pcall(require, "harpoon")
if not ok then
  return
end

---@diagnostic disable-next-line: missing-fields
harpoon.setup({
  excluded_filetypes = { "harpoon", "snacks_picker_list" },
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
  },
})

local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

local set_keymaps, nnoremap = require("setup.helpers").set_keymaps, require("setup.keymap").nnoremap

set_keymaps(nnoremap, {
  {
    "<leader>hx",
    function()
      harpoon:list():add()
    end,
    "Add to harpoon",
  },
  {
    "<leader>hm",
    function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    "Harpoon menu",
  },
  {
    "<leader>hn",
    function()
      harpoon:list():next({ ui_nav_wrap = true })
    end,
    "Next harpoon",
  },
  {
    "<leader>hp",
    function()
      harpoon:list():prev({ ui_nav_wrap = true })
    end,
    "Previous harpoon",
  },
}, { silent = true })
