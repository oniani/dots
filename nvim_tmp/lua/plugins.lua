-- Ensure that `packer.nvim` is installed
local api = vim.api
local fn = vim.fn

local repo = "https://github.com/wbthomason/packer.nvim"
local path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(path)) > 0 then
    api.nvim_command(string.format("!git clone %s %s", repo, path))
    api.nvim_command("packadd packer.nvim")
end

-- Required since `packer.nvim` is in `opt` pack
api.nvim_command("packadd packer.nvim")

-- Initialize the plugin system
return require("packer").startup(function()
    use {
        -- Activate `packer.nvim`
        { "wbthomason/packer.nvim", opt = true },

        -- Productivity
        { "junegunn/fzf", run = ":fzf#install" },
        "junegunn/fzf.vim",
        "junegunn/goyo.vim",
        "tpope/vim-commentary",
        "tpope/vim-fugitive",

        -- LSP support
        { "neoclide/coc.nvim", branch = "release" },

        -- Visuals
        "lifepillar/vim-gruvbox8",
        "nvim-treesitter/nvim-treesitter",
        "hoob3rt/lualine.nvim",
        "kyazdani42/nvim-web-devicons",
    }
end)
