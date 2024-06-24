-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- lua functions that many plugins use --
    use("nvim-lua/plenary.nvim")

    -- theme --
    use("bluz71/vim-nightfly-guicolors")

    -- tmux & split window navigation --
    use("christoomey/vim-tmux-navigator")

    use("szw/vim-maximizer") -- maximizes and restores current window

    -- essential plugins --
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")

    -- commenting with gc --
    use("numToStr/Comment.nvim")

    -- file explorer --
    use("nvim-tree/nvim-tree.lua")

    -- icons --
    use("kyazdani42/nvim-web-devicons")

    -- statusline --
    use("nvim-lualine/lualine.nvim")

    -- fuzzy finding - Telescope --
    use({"nvim-telescope/telescope-fzf-native.nvim", run = 'make' })
    use ("debugloop/telescope-undo.nvim")
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

    -- autocompletion --
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    
  -- snippets --
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    -- managing & install lsp servers --
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- configuring lsp servers --
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    }) -- enhanced lsp uis
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

    -- bracket closer --
    use("jiangmiao/auto-pairs")

    use("tpope/vim-fugitive")

    use("mattn/emmet-vim")

    use("ervandew/supertab")

    use("timonv/vim-cargo")

    -- prettier --
    use ("jose-elias-alvarez/null-ls.nvim")
    use("MunifTanjim/prettier.nvim")

    -- HTML --
    use("windwp/nvim-ts-autotag")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
