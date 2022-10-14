local io = require("io")

-- map leader key to be /
vim.g.mapleader = "/"

local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', '<Cmd>tabedit<CR>')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- File IO
keymap.set('n','<C-s>','<Cmd>write<CR>') -- save/write file


-- Tabs
keymap.set('n','1','<Cmd>1tabnext<CR>')
keymap.set('n','2','<Cmd>2tabnext<CR>')
keymap.set('n','3','<Cmd>3tabnext<CR>')
keymap.set('n','4','<Cmd>4tabnext<CR>')
keymap.set('n','5','<Cmd>5tabnext<CR>')
keymap.set('n','6','<Cmd>6tabnext<CR>')
keymap.set('n','7','<Cmd>7tabnext<CR>')
keymap.set('n','8','<Cmd>8tabnext<CR>')
keymap.set('n','9','<Cmd>9tabnext<CR>')

-- switch tabs in visual mode 
keymap.set('v','1','<Cmd>1tabnext<CR>')
keymap.set('v','2','<Cmd>2tabnext<CR>')
keymap.set('v','3','<Cmd>3tabnext<CR>')
keymap.set('v','4','<Cmd>4tabnext<CR>')
keymap.set('v','5','<Cmd>5tabnext<CR>')
keymap.set('v','6','<Cmd>6tabnext<CR>')
keymap.set('v','7','<Cmd>7tabnext<CR>')
keymap.set('v','8','<Cmd>8tabnext<CR>')
keymap.set('v','9','<Cmd>9tabnext<CR>')


-- Select lines

-- trigger visual line from insert mode
keymap.set( "i", "<S-up>", "<c-o><S-v>k" )
keymap.set( "i", "<S-down>", "<c-o><S-v>j" )
keymap.set( "v", "<S-up>", "<up>" )
keymap.set( "v", "<S-down>", "<down>" )

-- trigger visual line from normal mode using shift
keymap.set( "n", "<S-up>", "<S-v>k" )
keymap.set( "n", "<S-down>", "<S-v>j" )


-- lua function to copy lines to clipboard

function CopyCurrentLineToClipboard()
    local ft = vim.bo.filetype
    if ft == "NvimTree" then
        require"nvim-tree".on_keypress("copy_absolute_path")
    else
		vim.cmd("normal ^\"+y$")
    end
end

-- quit window
keymap.set("n","<Leader>q","<Cmd>q<CR>")

-- copy lines keybind
keymap.set( "n", "<C-c>", ":lua CopyCurrentLineToClipboard()<CR>" )
keymap.set( "i", "<C-c>", "<C-o>:lua CopyCurrentLineToClipboard()<CR>" )

keymap.set( "v", "<C-c>", "\"+ygv" )

-- paste lines
keymap.set("n","<C-v>","\"+p")


-- move lines up and down

keymap.set("n","<C-down>",":m .+1<CR>==")
keymap.set("n","<C-up>",":m .-2<CR>==")

keymap.set("v","<C-down>",">+1<CR>gv=gv")
keymap.set("v","<C-up>","<-2<CR>gv=gv")

local function split(inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local t={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
   end
   return t
end

-- open neo tree with current directory
function OpenNeoTree()
  -- get current directory
  local x = vim.cmd("ls")

  local y = split(x,"\"\"")
  --local handle = io.popen("pwd")
  --local result = handle:read("*a")
  local dir = io.read("*a")
  print(dir,vim.inspect(y))
  -- open Neotreee with the directory
  --vim.api.nvim_command("pwd | Neotree")
end

