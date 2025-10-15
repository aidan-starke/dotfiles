local M = {}

M.merge_tables = function(...)
	return vim.tbl_extend("force", ...)
end

M.set_keymaps = function(set_keymap, pairs, opts)
	opts = opts or {}
	for _, pair in ipairs(pairs) do
		---@diagnostic disable-next-line: deprecated
		local key, map, desc = unpack(pair)

		local keymap_opts = opts
		if desc then
			keymap_opts = vim.tbl_extend("force", opts, { desc = desc })
		end

		set_keymap(key, map, keymap_opts)
	end
end

return M
