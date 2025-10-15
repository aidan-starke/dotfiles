local ok, hop = pcall(require, "hop")
if not ok then
  return
end

hop.setup()

local hint, directions = hop.hint_char1, require("hop.hint").HintDirection
local set_keymaps, remap = require("setup.helpers").set_keymaps, require("setup.keymap").remap

set_keymaps(remap, {
  {
    "f",
    function()
      hint({ direction = directions.AFTER_CURSOR })
    end,
    "Hop forward to char",
  },
  {
    "F",
    function()
      hint({ direction = directions.BEFORE_CURSOR })
    end,
    "Hop backward to char",
  },
  {
    "t",
    function()
      hint({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
    end,
    "Hop forward before char",
  },
  {
    "T",
    function()
      hint({ direction = directions.BEFORE_CURSOR, hint_offset = -1 })
    end,
    "Hop backward before char",
  },
})
