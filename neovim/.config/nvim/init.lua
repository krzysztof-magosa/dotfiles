-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- default leader is \, which matches muscle memory from the original config

require("lazy").setup({
  -- Colorscheme
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function() vim.cmd("colorscheme bluloco") end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
      options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = "",
        section_separators = "",
      },
    },
  },

  -- Fuzzy finding — core workflow
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { preview_width = 0.55 },
        },
      })
      telescope.load_extension("fzf")
    end,
  },

  -- Syntax highlighting
  -- New nvim-treesitter API: highlighting via vim.treesitter, install() for parsers
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "lua", "python", "bash", "yaml", "json", "toml",
        "hcl", "terraform", "dockerfile", "markdown", "regex",
      })
      vim.api.nvim_create_autocmd("FileType", {
        callback = function() pcall(vim.treesitter.start) end,
      })
    end,
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  -- Git commands (:G blame, :Gvdiffsplit, etc.)
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gvdiffsplit", "Gblame" },
  },

  -- Comment / uncomment
  {
    "tpope/vim-commentary",
    keys = { "gc", "gcc" },
  },

  -- Surround: ys, cs, ds
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  -- Auto-close brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Terraform
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "hcl" },
    init = function()
      vim.g.terraform_fmt_on_save = 1
      vim.g.hcl_align = 1
    end,
  },

  -- Trailing whitespace highlight
  {
    "ntpeters/vim-better-whitespace",
    event = "BufReadPost",
  },
}, {
  ui = { border = "rounded" },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "matchparen", "netrwPlugin",
        "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})

-- Options
vim.o.number         = true
vim.o.relativenumber = true
vim.o.cursorline     = true
vim.o.mouse          = "a"
vim.o.breakindent    = true
vim.o.wrap           = false
vim.o.undofile       = true
vim.o.ignorecase     = true
vim.o.smartcase      = true
vim.o.expandtab      = true
vim.o.shiftwidth     = 4
vim.o.tabstop        = 4
vim.o.softtabstop    = 4
vim.o.smartindent    = true
vim.o.updatetime     = 250
vim.o.signcolumn     = "yes"
vim.o.scrolloff      = 10
vim.o.laststatus     = 3
vim.o.termguicolors  = true
vim.o.hlsearch       = true
vim.o.showmatch      = true
vim.o.colorcolumn    = "80"
vim.o.inccommand     = "nosplit"  -- live preview for :s/foo/bar
vim.o.clipboard      = "unnamedplus"  -- system clipboard by default

-- Keymaps
local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Clear search highlight
map("n", "<esc>", "<cmd>nohlsearch<cr>")

-- Telescope
map("n", "<leader>f",       "<cmd>Telescope find_files<cr>",                "Find files")
map("n", "<leader>g",       "<cmd>Telescope live_grep<cr>",                 "Live grep")
map("n", "<leader>*",       "<cmd>Telescope grep_string<cr>",               "Grep word under cursor")
map("n", "<leader>b",       "<cmd>Telescope buffers<cr>",                   "Buffers")
map("n", "<leader><space>", "<cmd>Telescope oldfiles<cr>",                  "Recent files")
map("n", "<leader>/",       "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in buffer")

-- Window navigation
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- Terminal: Esc exits insert mode
map("t", "<esc>", "<c-\\><c-n>")

-- Stay in visual mode after indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Navigate visual lines (word-wrapped content)
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Home/End keys
map("n", "<Home>", "^")
map("n", "<End>",  "$")

-- Autocmds
local augroup = vim.api.nvim_create_augroup("init", { clear = true })

-- Restore cursor position on file open
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Flash yanked region
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function() vim.highlight.on_yank() end,
})

-- Don't auto-insert comment leaders on new lines
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  callback = function() vim.opt.formatoptions:remove({ "c", "r", "o" }) end,
})

-- vim: ts=2 sts=2 sw=2 et
