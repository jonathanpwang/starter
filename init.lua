vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

vim.opt.rtp:prepend(lazypath)
vim.opt.clipboard = "unnamedplus"

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "git")

-- Override grey diff colors with visible ones (must be after base46 loads)
vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2a4a2a", fg = "#98c379" })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#4a2a2a", fg = "#e06c75" })
vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2a3a4a", fg = "#61afef" })
vim.api.nvim_set_hl(0, "DiffText", { bg = "#3a5a7a", fg = "#e5c07b", bold = true })

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
