-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = {
	statusline = {
		modules = {
			-- show the file's path relative to cwd instead of just its name
			file = function()
				local stl_utils = require "nvchad.stl.utils"
				local bufnr = stl_utils.stbufnr()
				local path = vim.api.nvim_buf_get_name(bufnr)

				local name, icon = "Empty", "󰈚"

				if path ~= "" then
					name = vim.fn.fnamemodify(path, ":.")

					local devicons_present, devicons = pcall(require, "nvim-web-devicons")
					if devicons_present then
						local ft_icon = devicons.get_icon(vim.fn.fnamemodify(path, ":t"))
						icon = ft_icon or icon
					end
				end

				local sep_r = stl_utils.separators.default.right
				return "%#St_file# " .. icon .. " " .. name .. " %#St_file_sep#" .. sep_r
			end,
		},
	},
}

-- M.nvdash = { load_on_startup = true }

return M
