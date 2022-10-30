local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
	return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    ensure_dependencies = true,
    auto_clean = true,
    compile_on_sync = true,
    transitive_disable = true, -- automatically disable dependencies of disabled plugins
    auto_reload_compiled = true, -- automatically reload the compiled file after creating it.

    display = {
	open_fn = function()
	    return require("packer.util").float { border = "rounded" }
	end
    }
}

return packer.startup(function(use)

    use "neovim/nvim-lspconfig"

    use 'wbthomason/packer.nvim'

    use 'nvim-lualine/lualine.nvim' -- statusline
    use 'nvim-lua/plenary.nvim' -- common utilities


    
  -- cmp plugins
    use "hrsh7th/nvim-cmp" -- the completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    use 'L3MON4D3/LuaSnip' -- snippet engine
    use 'rafamadriz/friendly-snippets' -- useful snippets for different languages
    

    use "akinsho/toggleterm.nvim"
    use "windwp/nvim-autopairs"

    -- lsp
    use "williamboman/mason.nvim"
    use 'williamboman/mason-lspconfig.nvim'
    use "jose-elias-alvarez/null-ls.nvim"

    
    if packer_bootstrap then
	    require('packer').sync()
    end
end)




