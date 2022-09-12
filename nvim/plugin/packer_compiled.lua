-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/user/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/user/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/user/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/user/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/user/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18plugins.fterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  LuaSnip = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\2/\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\20plugins.bufline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\0024\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0" },
    load_after = {
      ["lualine.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\0020\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.indentline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    after = { "fidget.nvim" },
    config = { "\27LJ\2\2/\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.lsp.mason\frequire\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neogit = {
    config = { "\27LJ\2\2.\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\19plugins.neogit\frequire\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\0023\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\24plugins.lsp.null-ls\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18plugins.pairs\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "cmp-buffer", "cmp-path" },
    config = { "\27LJ\2\0024\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\25plugins.lsp.nvim-cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\0023\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\24plugins.lsp.servers\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-lspconfig", "null-ls.nvim" },
    config = { "\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\2H\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0'\1\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-symbols.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-symbols.nvim", "telescope-fzf-native.nvim" },
    config = { "\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/user/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-commentary"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-sandwich"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/user/.local/share/nvim/site/pack/packer/opt/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.lsp.mason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\2.\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\19plugins.neogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\2?\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'nvim-tree.lua', 'telescope.nvim', 'friendly-snippets', 'FTerm.nvim'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'indent-blankline.nvim', 'vim-commentary', 'vim-sandwich', 'gitsigns.nvim', 'bufferline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp', 'LuaSnip'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'lualine.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
