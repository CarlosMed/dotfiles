--[[ Apperance ]]
vim.opt.termguicolors = true -- turn on termguicolors for colorscheme
vim.opt.background = "dark" -- setting colorschemes that can be light or dark will be made dark

vim.opt.nu = true -- adds numbers to the gutter
vim.opt.rnu = true -- adds relative numbers to the gutters
vim.o.mouse = "a" -- allows the use of the mouse

vim.opt.colorcolumn = "80" -- adds a column at the 80pt mark
vim.opt.cursorline = true -- highlights cursor line
vim.wo.signcolumn = "yes" -- show sign column so that text doesn't shift

vim.opt.list = true -- show whitespace
-- vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  " } -- whitespace character to show
vim.opt.listchars = { tab = "⇥ ", space = "⋅", leadmultispace = "┊ ", trail = "␣", nbsp = "⍽" }

-- makes cursor blink
vim.opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Tabs, indents, word wrap
vim.opt.tabstop = 2 -- 4 spaces for tabs
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tabs to spaces
vim.opt.autoindent = true -- copy indent from current line when adding a new line
vim.opt.smartindent = true -- indents lines smartly
vim.opt.wrap = false -- option to wrap text
vim.opt.softtabstop = 2

--[[ Behavior ]]

vim.opt.splitright = true -- adds all split panes to the right
vim.opt.splitbelow = true -- adds all split panes to the bottom

-- Scrolling
vim.opt.scrolloff = 8 -- start scrolling once there are 8 lines left
vim.opt.isfname:append("@-@")

--code folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- vim.o.foldclose = "all"

-- searching
vim.o.ignorecase = true -- case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
vim.opt.hlsearch = false -- turns off highlight search
vim.opt.incsearch = true -- turns on incremental search

-- Decrease update time
vim.o.timeoutlen = 300
vim.o.updatetime = 50 -- fast update time

-- Undo history and swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--[[ UNUSED OPTIONS ]]
-- -- Set completeopt to have a better completion experience
-- vim.o.completeopt =  "menu,menuone,preview,noselect"

--[[ Sync clipboard between OS and Neovim.
 Remove this option if you want your OS clipboard to remain independent.
 See `:help 'clipboard'` ]]
-- vim.o.clipboard = 'unnamedplus'

-- Indent blankline
--[[ vim.opt.list = true
vim.opt.listchars:append "eol:↴" ]]
