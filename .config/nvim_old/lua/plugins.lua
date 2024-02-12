-- packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local packer_repo = 'https://github.com/wbthomason/packer.nvim'

-- Auto-install packer in case it hasn't been installed.
if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_echo({ { 'Installing packer.nvim', 'Type' } }, true, {})
  vim.cmd(string.format('10split |term git clone --depth=1 %s %s', packer_repo, install_path))
end

-- Load packer.nvim
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Simple plugins can be specified as strings
  use '9mm/vim-closer'
  
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'norcalli/nvim_utils'
  
  use 'neovim/nvim-lspconfig'
  
  use { 'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' }
  use 'Shougo/deoplete-lsp'
  use 'ervandew/supertab'
  use 'Chiel92/vim-autoformat'
  
  -- -- Lazy loading:
  -- -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  
  -- -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}
  
  -- -- Load on a combination of conditions: specific filetypes or commands
  -- -- Also run code after load (see the 'config' key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }
  
  -- -- Plugins can have dependencies on other plugins
  -- use {
  --   'haorenW1025/completion-nvim',
  --   opt = true,
  --   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- }
  
  -- -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}
  
  -- -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  
  -- -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  
  -- -- Post-install/update hook with call of vimscript function with argument
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  
  -- -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }
  
  -- -- Use dependency and run lua function after load
  -- use {
  --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --   config = function() require('gitsigns').setup() end
  -- }
  
  -- -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
  
  -- -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}
end)

require 'nvim_utils'
-- Run PackerCompile when this luascript changes
nvim_create_augroups({
  packer_auto_compile = {
    { 'BufWritePost', '*/nvim/lua/plugins.lua', 'source <afile> | PackerCompile' }
  }
})
