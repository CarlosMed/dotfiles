local keymap = vim.keymap

-- remapping leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
keymap.set(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)
-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("i", "jj", "<ESC>") -- escapes while in insert mode

-- running test for plugins
keymap.set("n", "<leader>ts", "<Plug>PlenaryTestFile")

-- moves selected text while in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z") -- leaves cursor in place when <shift + j>

-- keeps the cursor in the middle when scrolling
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set({ "n", "o", "x" }, "<S-h>", "^", { noremap = true, silent = true })
keymap.set({ "n", "o", "x" }, "<S-l>", "g_", { noremap = true, silent = true })

keymap.set("n", "<leader>ba", "<cmd>%bd|e#|bd#<cr>", { desc = "Delete All Buffers" })
-- keymap.set("i", "<c-j>", "<c-n>", { noremap = true, silent = true })
-- keymap.set("i", "<c-k>", "<c-p>", { noremap = true, silent = true })

-- allows search terms to stay in the middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- paste previous copy without losing current paste buffer
keymap.set("x", "<leader>p", [["_dP]])

-- allows you to yank into system clipboard : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })

-- allows you to delete into void clipboard : asbjornHaland
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- formats the file pretty much
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- does a search and replace on the word where the cursor is hovering over
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace Instance" })

-- makes a file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- increment/decrement numbers
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- lazy
keymap.set("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Buffer Previous" })
keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Buffer Next" })
keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- better up/down
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-S-Right>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-S-Left>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
keymap.set("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "First Tab" })

-- buffers
-- keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Move to window using the <ctrl> hjkl keys
-- keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
-- keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Terminal Mappings
-- keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
-- keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
-- keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
-- keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
-- keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
-- keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- -- Move Lines
-- keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- -- use tmux-sessionizer by the primeagen
-- keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- -- goes to the next quickfix when running the :make cmd
-- keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- -- goes to the next location when running the :make cmd
-- keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
