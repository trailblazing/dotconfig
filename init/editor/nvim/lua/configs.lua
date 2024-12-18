local U        = require("utils")
local log      = require("log")
--  local cmd   = vim.cmd --  execute Vim commands
local exec     = vim.api.nvim_exec --  execute Vimscript
local api      = vim.api           --  neovim commands
local autocmd  = vim.api.nvim_create_autocmd --  execute autocommands
local augroup  = vim.api.nvim_create_augroup --  group autocommands
local set      = vim.opt --  global options
local setlocal = vim.opt_local --  local options
local cmd      = vim.api.nvim_command --  execute Vim commands
local fn       = vim.fn
local hl       = vim.api.nvim_set_hl
--  local posix    = require("posix.unistd")
local log      = require("log")

--  set.syntax     = 'false'
--  set.syntax     = 'off'
set.syntax     = 'on'
set.autoread   = true
cmd[[
set omnifunc=v:lua.vim.lsp.omnifunc
]]
set.omnifunc   = "v:lua.vim.lsp.omnifunc"
--  vim.opt.guifont --  need to be determined
--  set.clipboard     = "unnamed,unnamedplus"
--
--  E353: Nothing in register "
--  "" is the unnamed register. (:h quotequote)
	set.clipboard = { "unnamed", "unnamedplus" }
	--  set.clipboard = "unnamed"
	--  set.clipboard:append "unnamedplus"
	--  set.clipboard = set.clipboard + "unnamedplus"
	--  set.clipboard  = "unnamedplus"
--
--  set.guicursor    = ""
--  set.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50\
--  ,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor\
--  ,sm:block-blinkwait175-blinkoff150-blinkon175"
--
	set.guicursor = "n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20"
--
--  set.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
--  set.gcr       = ""
--  set.ignorecase   = true
set.ignorecase   = false
--  https://github.com/hrsh7th/nvim-cmp/blob/51260c02a8ffded8e16162dcf41a23ec90cfba62/lua/cmp/view/custom_entries_view.lua#L152
--  Default is 0 --  no limitation
--  set.pumheight     = 10 --  maybe too big ?
set.pumheight    = 0 --  maybe too big ?
--  mapping delays
--  set.timeoutlen   = 300
	set.timeoutlen   = 700
--  vim.g.mapleader      = "<Space>"
vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '
vim.g.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1


--  set.bg              = 'dark'
--  set.background      = 'dark'
--  vim.o.background    = 'dark'

--  set.bg              = 'light'
--  set.background      = 'light'
--  vim.o.background    = 'light'

--  indent_blankline needs this
set.termguicolors   = true
--  indent_blankline needs this
set.list            = true

--  indent_blankline
--  https://github.com/lukas-reineke/indent-blankline.nvim/commit/6c4ca1bb3e8c91da1acef812dc7017790282f818
vim.g.indent_blankline_use_treesitter        = 1
vim.g.indent_blankline_show_current_context  = 0
vim.g.indent_blankline_context_highlight     = 0
vim.g.indent_blankline_char                  = "│"
vim.g.show_first_indent_level                = 0
vim.g.indentLine_enabled                     = 1
vim.g.indent_blankline_enabled               = 1
--  HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn                           = "99999"


set.tabstop         = 4
set.shiftwidth      = 4
vim.g.vim_indent_cont = vim.opt.shiftwidth:get()
set.softtabstop     = -1

--  set.expandtab       = true --  easy to comment/uncoment switch lines, but display no indent line by default
	set.expandtab   = false
set.smarttab        = true
set.copyindent      = true
set.preserveindent  = true
set.textwidth       = 120
set.formatoptions   = "tqn1"
--  https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
--  /usr/share/nvim/runtime/ftplugin/lua.vim line 20
--  set.formatoptions   = "tcqrn1"
--  set.formatoptions   = set.formatoptions - "cr"

--  Does not work
--  set.formatoptions:remove({ "c", "r", "o" })
set.mouse           = "a"
set.showcmd         = true
set.number          = true
set.relativenumber  = true
set.hidden          = true
set.hlsearch        = true
--  set.backspace        = "2"
--  set.laststatus       = 2
   set.shortmess       = "actWAOFS"
   set.shortmess       = set.shortmess + "c"
--  https://vi.stackexchange.com/questions/42366/if-i-set-cmdheight-0-i-get-the-press-enter-or-type-command-to-continue-message
   set.shortmess       = set.shortmess + "csCFSW"
--  https://stackoverflow.com/questions/890802/how-do-i-disable-the-press-enter-or-type-command-to-continue-prompt-in-vim
--  set.shortmess       = ""
--  set.shortmess:append "c"
--
--  https://www.reddit.com/r/neovim/comments/1b13a69/what_is_this_extra_stuff_on_the_side/
--  set.signcolumn   = "number"
set.signcolumn      = "yes"
--  set.signcolumn   = "yes:2"

set.inccommand      = "split"

set.autowriteall    = true
set.whichwrap       = "b,s,<,>,h,l,[,]"
--  set.whichwrap        = "bs<>[]hl" --  travel prev/next line

set.wrap            = false
set.linebreak       = true --  good if wrap is turned off
set.wrapmargin      = 0
set.backspace       = "indent,eol,start"
set.eadirection     = "ver"
set.equalalways     = false

--  Disable /usr/share/nvim/runtime/ftplugin.vim
vim.g.did_load_ftplugin = 1
--  Disable /usr/share/nvim/runtime/matchparen.vim
vim.g.loaded_matchparen =1

set.cursorline      = true
--  set.cursorline      = false

set.cursorcolumn    = true
--  set.cursorcolumn    = false
--
--  set.cmdheight       = 1
set.cmdheight       = 0
set.ruler           = false
set.laststatus      = 0
set.showtabline     = 0          --  Always display the tabline, even if there is only one tab
set.showmode        = false      --  Hide the default mode text (e.g. --  INSERT --  below the statusline)
set.complete        = set.complete + 'kspell'
--  set.cryptmethod      = "blowfish2"
if vim.opt_local.modifiable:get() == true then
	set.fileencoding = 'utf-8'
end
set.encoding        = "utf-8"
--  set.termencoding    = "utf-8"
set.spelllang       = "en_us"
--  E167: :scriptencoding used outside of a sourced file
--  cmd([[:scriptencoding utf-8]])
set.matchpairs      = set.matchpairs  + '<:>'
set.maxmempattern   = 5000
set.modeline        = true
set.modelines       = 2
set.errorbells      = false
set.visualbell      = false
--  set.t_vb             = ''
	cmd([[set t_vb=]])
set.shiftround      = false
set.spell           = false
set.startofline     = false

--  https://groups.google.com/g/vim_dev/c/UHCX5L2GfkU
--  set.scrolloff       = 20
set.scrolloff       = 999
--  set.scrolloff        = 8
set.sidescrolloff   = 30
--  set.sidescrolloff    = 8
set.scrollopt       = set.scrollopt - 'ver'
set.showcmd         = false

--  https://stackoverflow.com/questions/307148/vim-scrolling-slowly
--  set.showmatch       = true
set.showmatch       = false

set.splitbelow      = true
set.splitright      = true
set.ttimeout        = true
--  key code delays
set.ttimeoutlen     = 1

set.ttyfast         = true
--  weird behavior: automatically moving cursor one character left/backward when shfit+a
---  set.virtualedit     = "block"
set.virtualedit     = "onemore"
set.wildmenu        = true
set.wildmode        = "full"
set.paste           = false
set.title           = true
--  set.more            = true
set.more            = false
setlocal.cino       = "e-2"
set.smartcase       = true
set.smartindent     = true
set.autoindent      = true
vim.cmd([[
function! s:get_indent()
   let lnum = prevnonblank(v:lnum - 1)
   let ind = indent(lnum)
   return ind
endfunction
set indentexpr=s:get_indent()
]])
function get_indent()
	vim.cmd([[
	let lnum = prevnonblank(v:lnum - 1)
	let g:ind = indent(lnum)
	" return ind
	]])
	return vim.g.ind
end

--  set.indentexpr      = get_indent()
set.incsearch       = true
if vim.fn.exists('$TMUX') then
	--  set.t_ut = ''
	cmd([[set t_ut=]])
	--  [TUI: in tmux, background color is not detected #17070](https://github.com/neovim/neovim/issues/17070)
	vim.loop.fs_write(2, "\27Ptmux;\27\27]11;?\7\27\\", -1, nil)
end
set.backup          = false
set.writebackup     = false
set.tags            = "./tags,tags;" .. vim.env.HOME
set.switchbuf       = 'uselast'
--  https://vi.stackexchange.com/questions/39972/prevent-neovim-lsp-from-opening-a-scratch-preview-buffer
--  set.completeopt  = { "menuone", "noselect" }
set.completeopt     = 'menu'
set.completeopt     = set.completeopt + 'menuone'
set.completeopt     = set.completeopt + 'noinsert'
set.completeopt     = set.completeopt + 'noselect'
set.completeopt     = set.completeopt - 'preview'
set.belloff         = set.belloff + 'ctrlg'
set.redrawtime      = 1000
--  set.lazyredraw      = true
--  set.sessionoptions  = 'blank,buffers,curdir,help,tabpages,winsize,terminal,options,localoptions'
--  set.sessionoptions  = 'blank,buffers,curdir,help,tabpages,winsize,terminal'
--  set.sessionoptions  = ''
set.sessionoptions  = 'buffers,curdir,tabpages,winsize,terminal,options,localoptions'
--  set.sessionoptions  = set.sessionoptions - 'buffers'
set.sessionoptions  = set.sessionoptions - 'localoptions'
set.sessionoptions  = set.sessionoptions - 'options'
--  set.sessionoptions  = set.sessionoptions - 'curdir'
--  set.sessionoptions  = set.sessionoptions - 'tabpages'
--  set.sessionoptions  = set.sessionoptions - 'winsize'
--  set.sessionoptions  = set.sessionoptions - 'terminal'
--  set.sessionoptions  = set.sessionoptions - 'blank'
--
--  set.sessionoptions  = set.sessionoptions - 'help'
--  set.sessionoptions   = set.sessionoptions + 'buffers'
--  This "options" will include deprecated maps
--  set.sessionoptions   = set.sessionoptions + 'options'
set.viewoptions     = 'folds,cursor,unix,slash'
--  https://toddknutson.bio/posts/how-to-enable-neovim-undo-backup-and-swap-files-when-switching-linux-groups/
--  USER = os.getenv("USER")
--  local curr_group = vim.fn.system("id -ng 2> /dev/null | tr -d '\n'")
--  if USER ~= 'root' then
--   --  SWAPDIR    = "/home/" .. curr_group .. "/" .. USER .. "/nvim/swap//"
--   SWAPDIR    = "/home/" .. USER .. "/nvim/swap//"
--   --  BACKUPDIR  = "/home/" .. curr_group .. "/" .. USER .. "/nvim/backup//"
--   BACKUPDIR  = "/home/" .. USER .. "/nvim/backup//"
--   --  UNDODIR    = "/home/" .. curr_group .. "/" .. USER .. "/nvim/undo//"
--   UNDODIR    = "/home/" .. USER .. "/nvim/undo//"
--  else
--   SWAPDIR    = "/" .. USER .. "/nvim/swap//"
--   BACKUPDIR  = "/" .. USER .. "/nvim/backup//"
--   UNDODIR    = "/" .. USER .. "/nvim/undo//"
--  end
SWAPDIR    = os.getenv('XDG_DATA_HOME') .. '/nvim/swap//'
BACKUPDIR  = os.getenv('XDG_DATA_HOME') .. '/nvim/backup//'
UNDODIR    = os.getenv('XDG_DATA_HOME') .. '/nvim/undo//'
if vim.fn.isdirectory(SWAPDIR) == 0 then
	vim.fn.mkdir(SWAPDIR, "p", "0o700")
end

if vim.fn.isdirectory(BACKUPDIR) == 0 then
	vim.fn.mkdir(BACKUPDIR, "p", "0o700")
end

if vim.fn.isdirectory(UNDODIR) == 0 then
	vim.fn.mkdir(UNDODIR, "p", "0o700")
end
--  Enable swap, backup, and persistant undo
set.directory  = SWAPDIR
set.backupdir  = BACKUPDIR
set.undodir    = UNDODIR
--  Do you have alternatives?
--  set.swapfile     = false
set.swapfile   = true
set.backup     = true
set.undofile   = true

--  Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
		vim.o.backupext = extension
	end,
})

--  set.conceallevel = 2
--  set.conceallevel = 1
set.conceallevel    = 0
set.fillchars       = "vert:│,horiz:_,eob: "
set.secure          = true
--  https://stackoverflow.com/questions/890802/how-do-i-disable-the-press-enter-or-type-command-to-continue-prompt-in-vim
set.efm             = set.efm + '#%t#%f#%l#%c#%m#'
set.cpoptions:append('W')

--  https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
--  set.modelineexpr = false
--
--  commented this, because bwe ge keys are also interpreted hyphenated
--  words as single word
--  vim.opt.iskeyword:append "-" --  hyphenated-words recognizerd by search

--  Illuminate plugin higlighting
vim.api.nvim_set_hl(0, "IlluminatedWordText",  { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead",  { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

--  undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
--  https://stackoverflow.com/questions/5017009/confusion-about-vim-folding-how-to-disable
--  https://www.reddit.com/r/neovim/comments/xtnc54/how_do_i_disable_all_folding_in_all_documents/
--  vim.api.nvim_set_var('vimwiki_folding', 'custom')
--  https://github.com/vimwiki/vimwiki/issues/1197
--  vim.api.nvim_set_var('vimwiki_folding', 'expr:quick')  --   moved to wiki.lua

--  set.foldenable      = false
set.foldenable      = true

--  https://github.com/neovim/neovim/issues/8350
--  vim.cmd[[
--  :autocmd WinNew * wincmd H
--  ]]


--  initialize global var to false -> nvim-cmp turned off per default
vim.g.cmptoggle                = false
--  set.wrapscan                   = false
set.wrapscan                   = true



set.fillchars = {
	vert       = "│", --  alternatives │
	--  vert    = "▕", --  alternatives │
	fold       = " ",
	--  eob     = " ", --  suppress ~ at EndOfBuffer
	eob        = " ", --  suppress ~ at EndOfBuffer
	diff       = "░", --  alternatives = ⣿ ░ ─
	--  diff    = "╱", --  alternatives = ⣿ ░ ─
	--  msgsep     = "‾",
	msgsep     = "│",
	--  foldopen   = "▾",
	foldopen   = "│",
	foldsep    = "│",
	--  foldclose  = "▸",
	foldclose  = "│",
}

set.listchars = {
	--  nbsp     = '⦸',
	nbsp        = '%',
	--  extends  = '»',
	extends     = '>',
	--  precedes = '«',
	precedes    = '<',
	--  tab      = '▷─',
	--  tab      = '>-',
	--  tab      = ' U+FF3F',
	--  tab         = ' \'',
	tab         = '│ ',
	--  tab         = '▎ ',
	--  tab      = ' _',
	--  trail    = '•',
	trail       = '·',
	space       = ' '
	--  eol      = '↴'
}


function filetype_autocmd(filetype, cmd, params)
	autocmd("FileType", { pattern = filetype, command = cmd .. ' ' .. params })
end

function buffer_autocmd(pattern, cmd, params)
	autocmd("BufRead", { pattern = pattern, command = cmd .. ' ' .. params })
end

function hold_autocmd(pattern, cmd)
	autocmd("CursorHold", { pattern = pattern, command = cmd })
end

set.titleold = [[ ${substitute(system("uname"),'\(.*\)\n','%\1%','')} ]]

local group = augroup("on_bufenter", { clear = true })
autocmd("BufEnter", {
	callback = function()
		--  Will erase file name
		--  set.titlestring = [[ %{expand("%:p:~:.:h")} ]]
		--  set.titlestring = [[ %{expand("%:p:~:.")} ]]
		--  https://vim.fandom.com/wiki/Insert_current_filename
		set.titlestring = [[ %{expand("%:t") . " @ " . expand("%:p:~:.:h")} ]]
	end,
	desc = "Set the window title",
	group = group,
	pattern = "*",
})

vim.api.nvim_create_user_command(
	"RL",
	function()


		vim.cmd.source(os.getenv("DOT_CONFIG") .. '/editor/nvim/lua' .. "/configs.lua")
		vim.cmd.source(os.getenv("DOT_CONFIG") .. '/editor/nvim/after/plugin' .. "/colors.lua")
		vim.cmd.source(os.getenv("DOT_CONFIG") .. '/editor/nvim/after/plugin' .. "/keybindings.lua")
		vim.cmd.source(os.getenv("DOT_CONFIG") .. '/editor/nvim/lua/plugins' .. "/indent-blankline.lua")

		vim.api.nvim_command("colorscheme onehalf-lush-dark")
		--  vim.o.background = 'dark'
		vim.opt.background = 'dark'

		--  vim.api.nvim_win_set_options("background", "dark")
	end,
	{ nargs = '?', bang = true, silent }
)

vim.api.nvim_create_user_command(
	"SO",
	function()
		vim.cmd[[
		" :execute ('write ! ' . expand('%'))
		execute ('write !')
		execute ('source '. expand('%'))
		]]

	end,
	{ nargs = '?', bang = true, silent }
)


--  Does not work in complex scenarioes
--  vim.cmd([[
--  func! s:retabindents()
--   let saved_view = winsaveview()
--   " E486: Pattern not found: ^\( \{4}\)\+
--   execute '%s@^\( \{'.&ts.'}\)\+@\=repeat("\t", len(submatch(0))/'.&ts.')@'
--   call winrestview(saved_view)
--  endfunc
--  " Retab spaced file, but only indentation
--  " command! RetabIndents call RetabIndents()
--  command! RI call <sid>retabindents()
--  " Retab spaced file, but only indentation
--  ]])

--  "Thyrum/vim-stabs",
--  Usage RT { retab = true, }
--  Usage RT
vim.api.nvim_create_user_command(
	"RT",
	function(retab)
		--  print("retab", serialize(retab))
		--  print("retab.qargs", retab.qargs)
		print("retab.fargs", serialize(retab.fargs))
		local args = retab.fargs
		if
			args[1] ~= nil
			and args[1] ~= ""
			--  and retab ~= {}
			--  and type(retab) ~= 'table'
			then
			print("branch retab")
			vim.opt_local.expandtab = true
			vim.cmd("retab")
		else
			print("branch RetabIndent")
			vim.opt_local.expandtab = true
			vim.cmd("retab")
			vim.opt_local.expandtab = false
			vim.cmd("RetabIndent")

		end
		--   vim.cmd("write " .. vim.fn.expand('%'))
		--   vim.cmd(":w")
			 vim.cmd[[
			 execute ('write !')
			 call boot#write_generic()
			 ]]
		--   vim.cmd("redraw!")
	end,
	{ nargs = '?', bang = true, silent }
)

--  vim.api.nvim_create_user_command(
--   "W",
--   function()
--       vim.cmd('call boot#write_generic()')
--   end,
--   { nargs = '?', bang = true, silent }
--  )

--  Heavy operation
--  local group = augroup("retab_on_save", { clear = true })
--  autocmd("BufWritePre", {
--   callback = function()
--       --  set tabstop=4
--       set.expandtab = true
--       vim.cmd("retab")
--       set.expandtab = false
--       --  vim.cmd(" %retab!")
--       vim.cmd("RetabIndent")
--       vim.cmd("redraw!")
--   end,
--   desc = "retab! on save",
--   group = group,
--   pattern = "*",
--  })

--  https://stackoverflow.com/questions/20426986/vim-tab-oddities-have-to-retab-every-save
--  autocmd BufWritePre *.slim :call ResetSpaces()

--  https://neovim.discourse.group/t/how-to-create-a-new-vim-command-in-lua/986
vim.api.nvim_create_user_command(
	"BW",
	function()
		--  :silent! bprevious <bar> bdelete<bang> #
		vim.cmd("bprevious | bdelete! #")
	end,
	{ nargs = '?', bang = true, silent }
)

--  https://vi.stackexchange.com/questions/41798/make-colorscheme-change-when-background-change
--  Moved to colors.lua
--  vim.api.nvim_create_autocmd({ "OptionSet" }, {
--      pattern = { "background" },
--      callback = function()
--          if vim.o.background == 'dark' then
--              print("colorscheme", 'late dark')
--              --  vim.cmd("colorscheme modus-vivendi")
--              --
--
--              --  vim.cmd("colorscheme onehalf-lush-dark")
--              --  vim.api.nvim_command("colorscheme onehalf-lush-dark")
--              vim.api.nvim_command("colorscheme " .. vim.g.colors_name .. '-dark')
--
--              --  vim.cmd("colorscheme no-clown-fiesta")
--              --  vim.cmd("colorscheme nebulous")
--
--              --  vim.cmd("colorscheme dracula")
--          else
--              print("colorscheme", 'late light')
--              --  vim.cmd("colorscheme modus-operandi")
--
--              --  vim.cmd("colorscheme onehalf-lush")
--              --  vim.api.nvim_command("colorscheme onehalf-lush")
--              vim.api.nvim_command("colorscheme " .. vim.g.colors_name)
--
--              --  vim.cmd("colorscheme gruvbox")
--          end
--          --  force a full redraw:
--          vim.cmd("mode")
--          --  This line will override colorscheme
--          vim.cmd.source(os.getenv("DOT_CONFIG") .. '/editor/nvim/after/plugin' .. "/colors.lua")
--      end
--  })

--  vim.api.nvim_create_autocmd({"RecordingEnter"}, {
--   callback = function()
--       vim.opt.cmdheight = 1
--   end,
--  })
--
--  vim.api.nvim_create_autocmd({"RecordingLeave"}, {
--   callback = function()
--       vim.opt.cmdheight = 0
--   end,
--  })

--  https://stackoverflow.com/questions/5017009/confusion-about-vim-folding-how-to-disable
--  " Tweak the event and filetypes matched to your liking.
--  " Note, perl automatically sets foldmethod in the syntax file
--  autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
--  autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

--  Always report errors
--  vim.api.nvim_create_autocmd({"FileType"}, {
--   pattern  = { '*' },
--   callback = function()
--       vim.cmd("normal zR")
--   end,
--  })


--  vim.cmd([[
--  function! SessionState(updating)
--      if a:updating
--          let g:statusline_session_flag = "S"
--      else
--          let g:statusline_session_flag = ""
--      endif
--      execute "redrawstatus!"
--  endfunction
--  ]])
--
--  local session_auto_setup = augroup("on_bufenter", { clear = true })
--  autocmd("VimEnter", {
--      callback = function()
--          vim.cmd([[
--          :call session_auto#setup(function("SessionState"))
--          ]])
--      end,
--      desc = "Session status global variable updating",
--      group = session_auto_setup,
--      pattern = "*",
--  })

--  local file = vim.fn.expand("%:p:t")
--  local cwd = vim.fn.split(vim.fn.expand("%:p:h"):gsub("/", "\\"), "\\")
--
--  if file ~= "" and not utils.buff

set.title = true
--  set.updatetime = 100
set.updatetime = 1000

   filetype_autocmd("html",       "setlocal", "ts=4 sts=4 sw=4 omnifunc=htmlcomplete#CompleteTags")
   filetype_autocmd("xml",        "set", "omnifunc=xmlcomplete#CompleteTags")
   filetype_autocmd("javascript", "setlocal", "ts=4 sts=4 sw=4")
   filetype_autocmd("typescript", "setlocal", "ts=4 sts=4 sw=4")
--  pip install black
   filetype_autocmd("python", "setlocal", "ts=4 sts=4 sw=4 formatprg=black\\ -q\\ -")
   filetype_autocmd("yaml",   "setlocal", "ts=2 sts=2 sw=2")
   filetype_autocmd("cmake",  "setlocal", "ts=2 sts=2 sw=2 et")
   filetype_autocmd("css",    "setlocal", "ts=4 noet sw=4")
   filetype_autocmd("scss",   "setlocal", "ts=4 noet sw=4 omnifunc=csscomplete#CompleteCSS")
   filetype_autocmd("vue",    "syntax", "sync fromstart")
   filetype_autocmd("elixir", "setlocal", "formatprg=mix\\ format\\ -")
   buffer_autocmd("*.coffee",         "set", "ft=coffee")
   buffer_autocmd("*.less",           "set", "ft=less")
   buffer_autocmd("*.md",             "setlocal", "noet ft=markdown")
   buffer_autocmd("Cakefile",         "set", "ft=coffee")
   buffer_autocmd("*.pp",             "set", "ft=ruby")
--  buffer_autocmd("*.conf",           "set", "ft=dosini")
   buffer_autocmd("*.conf",           "set", "ft=conf")
   buffer_autocmd("*.tsx",            "set", "ft=typescript.tsx")
   buffer_autocmd("*.cls",            "set", "ft=apex syntax=java")
   buffer_autocmd("*.trigger",        "set", "ft=apex syntax=java")
   buffer_autocmd("*.nomad.template", "set", "ft=hcl")
   buffer_autocmd("*.txt",            "set", "ft=cmake")
   buffer_autocmd({"*.h", "*.hpp", "*.c", "*.cpp"},  "setlocal", "ts=2 sts=2 sw=2 et")

--  hold_autocmd("*", "silent call CocActionAsync('highlight')")

if U.is_linux() then
	vim.g.python3_host_prog = "/bin/python"
elseif U.is_mac() then
	vim.g.python3_host_prog = "/usr/local/bin/python3"
end
local boot_path = vim.fn.stdpath("data") .. "lazy/boot"

vim.opt.rtp:prepend(boot_path)

--  vim.g.vimwiki_filetypes = { "markdown" }  --  moved to wiki.lua

--  local log_file = log
--  local result = log.execute([[
--  echo "\$HOME = $HOME" >> $HOME/.vim.log
--  sed -i -e 's/b:Markdown_GetUrlForPosition/s:Markdown_GetUrlForPosition/g'
--   "$HOME/.local/share/nvim/lazy/vim-markdown/ftplugin/mkd.vim"
--  ]])

--  print(result)

--  Works
--  os.execute([[
--  sed -i -e 's/b:Markdown_GetUrlForPosition/s:Markdown_GetUrlForPosition/g' \
--   "$HOME/.local/share/nvim/lazy/vim-markdown/ftplugin/mkd.vim"
--  ]])

--  Works
--  os.execute([[
--  sh -c "sed -i -e 's/b:Markdown_GetUrlForPosition/s:Markdown_GetUrlForPosition/g' \
--   '$HOME/.local/share/nvim/lazy/vim-markdown/ftplugin/mkd.vim'"
--  ]])

--  Works
--  fn.system(
--  { 'sed', '-i', '-e',
--  's/b:Markdown_GetUrlForPosition/s:Markdown_GetUrlForPosition/g',
--  os.getenv("HOME") .. "/.local/share/nvim/lazy/vim-markdown/ftplugin/mkd.vim" }
--  )

--  Will block
--  cmd (
--  "!sed -i -e 's/b:Markdown_GetUrlForPosition/s:Markdown_GetUrlForPosition/g' " ..
--  " $HOME/.local/share/nvim/lazy/vim-markdown/ftplugin/mkd.vim"
--  )

--  Will block
--  vim.api.nvim_cmd(
--   {
--       cmd = '!',
--       args = { 'sed', '-i', '-e', 's/b:Markdown_GetUrlForPosition/s:Markdown_GetUrlForPosition/g',
--       "$HOME/.local/share/nvim/lazy/vim-markdown/ftplugin/mkd.vim", '>', '/dev/null' }
--   },
--   {}  --  { mods = { silent = true } }
--  )

--  https://www.reddit.com/r/neovim/comments/y1qibu/is_there_a_way_to_run_a_command_silently_with/
--  vim.fn.jobstart({ "firefox", vim.fn.expand("%") }, { detach = true })
--  Works
--  vim.fn.jobstart(
--   {
--       'sed', '-i', '-e',
--       's/b:Markdown_GetUrlForPosition/s:Markdown_GetUrlForPosition/g',
--       os.getenv("HOME") .. "/.local/share/nvim/lazy/vim-markdown/ftplugin/mkd.vim"
--   },
--   { detach = true }
--  )

--  Works
--  Update
--  git reset --hard origin/master
--  Chnaged to version = false in lazy-config.lua
--  local vim_markdown_path = os.getenv("XDG_DATA_HOME") .. "/nvim/lazy/vim-markdown/ftplugin"
--  if vim.loop.fs_stat(vim_markdown_path) then
--   local job = vim.fn.jobstart(
--       --  fn.system(
--       {
--           'sed', '-i', '-e',
--           's/b:Markdown_GetUrlForPosition/s:Markdown_GetUrlForPosition/g',
--           vim_markdown_path .. "/mkd.vim"
--       }
--       --  )
--       ,
--       {
--           cwd = vim_markdown_path,
--           on_exit = '',
--           on_stdout = '',
--           on_stderr = '',
--           detach = true,
--       }
--   )
--  end

--  will run before jobstart
--  vim.api.nvim_cmd(
--   {
--       cmd = 'source ',
--       args = { os.getenv("HOME") .. '/.local/share/nvim/lazy/vim-markdown/ftplugin/mkd.vim'}
--   },
--   {}  --  { mods = { silent = true } }
--  )

--  local vim_repeat_path = os.getenv("XDG_DATA_HOME") .. "/nvim/lazy/vim-repeat/autoload"
--  if vim.loop.fs_stat(vim_repeat_path) then
--   local job = vim.fn.jobstart(
--       --  fn.system(
--       {
--           'sed', '-i', '-e',
--           --  's/nmap u <Plug>(RepeatUndo)/nmap <c-u> <Plug>(RepeatUndo)/g',
--           's/nmap u <Plug>(RepeatUndo)/nmap <c-u> <Undo>/g',
--           '-e',
--           's/repeat#wrap(\'u\',v:count)/repeat#wrap(\'<c-u>\',v:count)/g',
--           vim_repeat_path .. "/repeat.vim"
--       }
--       --  )
--       ,
--       {
--           cwd = vim_repeat_path,
--           on_exit = '',
--           on_stdout = '',
--           on_stderr = '',
--           detach = true,
--       }
--   )
--  end

--  https://github.com/stevearc/profile.nvim/blob/master/README.md
local should_profile = os.getenv("NVIM_PROFILE")
if should_profile then
	require("profile").instrument_autocmds()
	if should_profile:lower():match("^start") then
		require("profile").start("*")
	else
		require("profile").instrument("*")
	end
end

local function toggle_profile()
	local prof = require("profile")
	if prof.is_recording() then
		prof.stop()
		vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" }, function(filename)
			if filename then
				prof.export(filename)
				vim.notify(string.format("Wrote %s", filename))
			end
		end)
	else
		prof.start("*")
	end
end
vim.keymap.set("", "<f1>", toggle_profile)

--  wk.register({ p = { name = "Perf Profiling" } }, { prefix = "<leader>u" })

vim.keymap.set("n", "<leader>ups", function()
	vim.cmd([[
		:profile start /tmp/nvim-profile.log
		:profile func *
		:profile file *
	]])
end, { desc = "Profile Start" })

vim.keymap.set("n", "<leader>upe", function()
	vim.cmd([[
		:profile stop
		:e /tmp/nvim-profile.log
	]])
end, { desc = "Profile End" })

M = {}
M.blockwise_register = function(register)
  register = register or "+"
  print("Making blockwise on", register)
  --  vim.cmd("call setreg('+', @+, 'b')") --  native vim way to set clipboard blockwise
  vim.cmd("call setreg('".. register .. "', @" .. register ..", 'b')")
end

vim.api.nvim_create_user_command('BlockwiseZero',    ':lua require("core.utils").blockwise_register("0")<CR>', { nargs = '?', bang = false})
vim.api.nvim_create_user_command('BlockwisePlus',    ':lua require("core.utils").blockwise_register("+")<CR>', { nargs = '?', bang = false})
vim.api.nvim_create_user_command('BlockwisePrimary', ':lua require("core.utils").blockwise_register("*")<CR>', { nargs = '?', bang = false})
vim.cmd([[cnoreab Bz BlockwiseZero]])
vim.cmd([[cnoreab B+ BlockwisePlus]])
vim.cmd([[cnoreab B* BlockwisePrimary]])




--  vim.g.suda#nopass   = 1
vim.cmd([[

" syntax off
" Disable /usr/share/nvim/runtime/ftplugin.vim
  let g:did_load_ftplugin = 1
  let did_load_ftplugin   = 1
" Disable /usr/share/nvim/runtime/matchparen.vim
  let g:loaded_matchparen = 1
" https://stackoverflow.com/questions/307148/vim-scrolling-slowly
  let loaded_matchparen   = 1

  let g:suda#nopass       = 1
  let g:restore_each_buffer_view = 1
" echom "\$HOME = " . $HOME
  let g:buffergator_use_new_keymap = 1
" https://github.com/preservim/vim-markdown
  let g:tex_conceal       = ""
  let g:vim_markdown_math = 1
  let g:vim_markdown_no_extensions_in_markdown = 1


" let boot_load_path = stdpath("data") . '/*/pack/*/start/boot/autoload/boot.vim'
  let boot_load_path = stdpath("data") . '/lazy/boot/autoload/boot.vim'
  exe 'set runtimepath+='. boot_load_path
  exe 'set packpath+='. boot_load_path
  execute "source "   . boot_load_path
  execute "runtime! " . boot_load_path

command! -nargs=1 -complete=help H :wincmd l | :enew | :set buftype=help | :keepalt h <args>

let g:vim_tags_auto_generate = 1

if has('nvim')
	let g:vim_tags_ctags_binary
		\  = boot#chomp(system(['which', 'ctags']))
else
	let g:vim_tags_ctags_binary
		\  = boot#chomp(system('which ctags'))
endif

  let g:vim_tags_project_tags_command
	\  = "{CTAGS} -R {OPTIONS} {DIRECTORY} 2>/dev/null"
  let g:vim_tags_gems_tags_command
	\  = "{CTAGS} -R {OPTIONS} `bundle show --paths` 2>/dev/null"
  let g:vim_tags_use_vim_dispatch            = 0
  let g:vim_tags_use_language_field          = 1
  let g:vim_tags_ignore_files
	\  = ['.gitignore', '.svnignore', '.cvsignore']
  let g:vim_tags_ignore_file_comment_pattern = '^[#"]'
  let g:vim_tags_directories
	\  = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]
  let g:vim_tags_main_file                   = 'tags'
  let g:vim_tags_extension                   = '.tags'
" let g:vim_tags_cache_dir                   = expand($HOME)
  let g:vim_tags_cache_dir                   = expand(stdpath('cache'))
  let g:tagbar_left                          = 1
  let g:tagbar_expand                        = 1
  let g:qf_bufname_or_text = 1

" Only works on vim
" :command! -nargs=0 -bang Quit :noautocmd qa!
" :cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'Quit' : 'q'

augroup Mkd
	au BufRead,BufWinEnter,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn} setlocal syntax=markdown
	au BufRead,BufWinEnter,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setlocal syntax=markdown
augroup END

" Moved to keybindings.lua
" command! -nargs=? -bang BW :silent! bprevious <bar> bdelete<bang> #
" nnoremap <silent> <Leader>d :<C-U>bprevious <bar> bdelete #<cr>
" nnoremap <silent> <Leader>q :Bdelete<CR>

" https://www.reddit.com/r/neovim/comments/oxddk9/how_do_i_get_the_value_from_a_highlight_group/
" call SynGroup()
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction

" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor

nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

com! CheckHighlightUnderCursor echo {l,c,n ->
		\   'hi<'    . synIDattr(synID(l, c, 1), n)             . '> '
		\  .'trans<' . synIDattr(synID(l, c, 0), n)             . '> '
		\  .'lo<'    . synIDattr(synIDtrans(synID(l, c, 1)), n) . '> '
		\ }(line("."), col("."), "name")


]])

--  command! -nargs=0 Quit :noautocmd qa!
--  :cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'Quit' : 'q'

--  vim.api.nvim_add_user_command('H', ':wincmd l | :enew | :set buftype=help | :keepalt h <args>', { nargs = 1, complete = help })
--  https://github.com/nanotee/nvim-lua-guide#vimapinvim_exec
vim.api.nvim_create_user_command(
	'H',
	':wincmd l | :enew | :set buftype=help | :keepalt h <args>',
	--  function(opts) --  "opts" for lua codes inside the function body
	--   --  ':wincmd l | :enew | :set buftype=help | :keepalt h <args>'
	--   vim.cmd([[
	--       :wincmd l | :enew | :set buftype=help | :keepalt h <args>
	--   ]])
	--   --  vim.api.nvim_exec([[
	--   --  :wincmd l | :enew | :set buftype=help | :keepalt h <args>
	--   --   ]], true)
	--  end,
	{ nargs = 1, complete = help }
)

vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = { 'help' },
	callback = function()
		vim.opt_local.number = true
	end,
})

--  https://stackoverflow.com/questions/73779049/how-to-get-current-cmdline-content-in-neovim
--  vim.api.nvim_create_autocmd({ 'CmdlineChanged', 'CmdlineEnter' },
vim.api.nvim_create_autocmd({ 'CmdlineLeave' },
{
	callback = function()
		local str, chk = vim.fn.getcmdline():gsub('', '')
		if chk > 1 then
			--  local fh = io.open(os.getenv('HOME') .. '/.vim.log', 'a+')
			local fh = io.open(log.address, 'a+')
			--  fh:write(('%s%s\n'):format(vim.fn.getcmdtype(), str:gsub(':', '')))
			local current_cmd = ('%s'):format(str)
			vim.g.current_cmd = current_cmd
			--  fh:write(('%s\n'):format(str))
			fh:write(('%s\n'):format(current_cmd))
			fh:flush()
			--  if current_cmd == "messages" then
			--   vim.cmd[[
			--   setlocal bufhidden=unload |
			--   \ wincmd L |
			--   \ vertical resize 100
			--   ]]
			--  end
		end
	end
}
)

vim.cmd[[
" autocmd BufWinEnter <buffer> wincmd H
augroup vertical_message
autocmd!
" autocmd FileType noice " Will resize all noice windows
" autocmd WinEnter * " does not work
" autocmd WinNew *
" autocmd BufReadPost *
" autocmd WinNew * autocmd BufEnter * ++once
" autocmd BufWinEnter * ++nested
  autocmd BufWinEnter,BufReadPost * ++nested
  \ if exists('g:current_cmd') && g:current_cmd =~? '\v(mes)'
  \ && &filetype =~? '\v(noice)' && &buftype =~? '\v(nofile)' |
  \ setlocal bufhidden=unload |
  \ wincmd H |
  \ vertical resize 100 | wincmd _ | endif | if &cmdheight ==? 1 | set cmdheight=0 | endif
" \ vertical resize 100 | wincmd _ | :exe 'resize ' . (winheight(0) + 9999) | :redraw | endif | if &cmdheight ==? 1 | set cmdheight=0 | endif

" Normally display when triggering command mode and quit it

" \ vertical resize 100 | resize winheight(1) | endif " Does not work
" \ vertical resize 100 | exec winheight(1) . '<C-W>_' | endif
" \ vertical resize 100 | wincmd _ | endif
" \ vertical resize 100 | z99<CR> | endif
" \ vertical resize 100 | wincmd _ | endif
" https://vi.stackexchange.com/questions/514/how-do-i-change-the-current-splits-width-and-height

" Will resize all noice windows
" autocmd FileType noice if v:insertmode !~? '\v(i)'
" \ && exists('g:current_cmd') && g:current_cmd =~? '\v(messages)'
" \ && &filetype =~? '\v(noice)' && &buftype =~? '\v(nofile)' |
" \ setlocal bufhidden=unload |
" \ wincmd H |
" \ vertical resize 100 | wincmd _ | :exe 'resize ' . (winheight(0) + 9999) | :redraw | endif

" This is the trick for messages window, when it is initializing it always has the height of one line
" autocmd WinClosed * :0 wincmd H | if winwidth(0) < 100 | vertical resize 100 | endif |
" Float windows closed triggered the following event
  autocmd WinNew,WinClosed *
  \ if exists('g:current_cmd') && g:current_cmd =~? '\v(mes)'
  \ && &filetype =~? '\v(noice)' && &buftype =~? '\v(nofile)' |
  \ setlocal bufhidden=unload |
  \ wincmd H | if winwidth(0) < 100 | vertical resize 100 | endif |
  \ if winheight(0) < 100 | wincmd _ | endif | endif | if &cmdheight ==? 1 | set cmdheight=0 | endif

augroup END

]]

--  vim.api.nvim_create_autocmd("WinClosed", {
--   group = vim.api.nvim_create_augroup("telescope_toggle", { clear = true }),
--   callback = function(args)
--       vim.keymap.set("n", "\\", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
--   end,
--  })
--
--  Synchronizing between the modified same files
--  Neovim automatically supports auto read by default

--
--  There is no lazyvim here
--  https://github.com/LazyVim/LazyVim/discussions/616
--  require("lazyvim.util").on_attach(function(_, buffer)
--   --  create the autocmd to show diagnostics
--   vim.api.nvim_create_autocmd("CursorHold", {
--       group = vim.api.nvim_create_augroup("_auto_diag", { clear = true }),
--       buffer = buffer,
--       callback = function()
--           local opts = {
--               focusable = false,
--               close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--               border = "rounded",
--               source = "always",
--               prefix = " ",
--               scope = "cursor",
--           }
--           vim.diagnostic.open_float(nil, opts)
--       end,
--   })
--  end)

vim.api.nvim_create_autocmd("LspAttach", {
	pattern = { '*' },
	group = vim.api.nvim_create_augroup("lsp_attach_auto_diag", { clear = true }),
	callback = function(args)
		--  the buffer where the lsp attached
		---@type number
		local buffer = args.buf

		--  create the autocmd to show diagnostics
		vim.api.nvim_create_autocmd("CursorHold", {
			group = vim.api.nvim_create_augroup("_auto_diag", { clear = true }),
			buffer = buffer,
			callback = function()
				local opts = {
					focusable = false,
					close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
					border = "rounded",
					source = "always",
					prefix = " ",
					scope = "cursor",
				}
				vim.diagnostic.open_float(nil, opts)
			end,
		})
	end,
})

--  vim.api.nvim_create_autocmd("LspAttach", {
--   desc = 'LSP actions',
--   --  callback = function(args)
--   callback = function(event)
--       local bufnr = event.buf
--       local opts = { buffer = event.buf }
--       local client = vim.lsp.get_client_by_id(event.data.client_id)
--       --  Ignore marksman items
--       if client.name == "marksman" then return end
--       --  these will be buffer-local keybindings
--       --  because they only work if you have an active language server
--       --  set some keymap here, or put anything you want to set after attach ls
--       --  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
--       vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--
--       vim.keymap.set('n', 'K',          '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
--       vim.keymap.set('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
--       vim.keymap.set('n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
--       vim.keymap.set('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
--       vim.keymap.set('n', 'go',         '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--       vim.keymap.set('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<cr>', opts)
--       vim.keymap.set('n', 'gs',         '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
--       vim.keymap.set('n', '<F2>',       '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
--       vim.keymap.set({'n', 'x'},        '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
--       vim.keymap.set('n', '<F4>',       '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
--
--       vim.api.nvim_create_autocmd("LspTokenUpdate", {
--           buffer = event.buf,
--           callback = show_unconst_caps,
--       })
--   end
--  })

--  https://github.com/neovim/nvim-lspconfig
--  Global mappings.
--  See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

--  Use LspAttach autocommand to only map the following keys
--  after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		--  Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		--  Buffer local mappings.
		--  See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print("list_workspace_folders", vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})


--  https://www.reddit.com/r/neovim/comments/usltce/how_to_disable_completion_for_command_line_window/
--  autocmd CmdWinEnter * lua require('cmp').setup({enabled = false})
--  autocmd CmdWinLeave * lua require('cmp').setup({enabled = true})
--  Uncomment these following two autocmd will end in cursor always moving left one character when typing
--  vim.api.nvim_create_autocmd({"CmdWinEnter"}, {
--   pattern = {"background"},
--   callback = function()
--       require('cmp').setup({enabled = false})
--   end
--  })
--
--  vim.api.nvim_create_autocmd({"CmdWinLeave"}, {
--   pattern = {"background"},
--   callback = function()
--       require('cmp').setup({enabled = true})
--   end
--  })

--  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost", "BufEnter", "WinEnter", "OptionSet" }, {
--  vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost", "CursorHold", "CursorHoldI" }, {
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		--  Using "bash" just because the server is "bashls"
		--  Set to sh will constantly give "Client xxxx quit with exit code 1 and signal 0"
		vim.cmd[[
		if match(getline(1),"/bin/sh") >= 0 | setlocal filetype=bash | endif
		" if match(getline(1),"sh") >= 0 | setlocal filetype=bash | endif
			]]
	end
})

--  enabled = function()
--   local buftype = vim.bo.buftype
--
--   if buftype == 'prompt' or buftype == 'nofile' then
--       return false
--   end
--
--   return true
--  end
--
--  https://stackoverflow.com/questions/40362460/show-cursor-in-command-line-mode
vim.cmd([[

" help TUI
" let &term  = 'linux-256color'
  let &term  = 'builtin_linux'
" let $TERM  = 'linux-256color'
  let $TERM  = 'linux'

" https://github.com/be5invis/Iosevka
" https://stackoverflow.com/questions/62200208/vim-change-cursor-in-command-line
" vim cursor escape codes for the terminal emulator
" INSERT (&t_SI)  - vertical bar (I-beam)
" REPLACE (&t_SR) - underscore
" VISUAL (&t_EI)  - block
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

if exists('$TMUX')
	let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[5 q\<Esc>\\"
	" let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[=1c\<Esc>\\"
	let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
	" let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[=2c\<Esc>\\"
else
	let &t_SI .= "\<Esc>[5 q"
	" let &t_SI .= "\<Esc>[=1c"
	let &t_EI .= "\<Esc>[2 q"
	" let &t_EI .= "\<Esc>[=2c"
endif

let &t_ti .= "\<esc>[2 q"

" set cursor to vertical bar when entering cmd line and
" revert cursor back to block when leaving cmd line
" Does not work in Neovim?
" autocmd CmdlineEnter * execute 'silent !echo -ne "' . &t_SI . '"'
" autocmd CmdlineLeave * execute 'silent !echo -ne "' . &t_EI . '"'

" autocmd CmdlineEnter * call echoraw(&t_SI)
" autocmd CmdlineLeave * call echoraw(&t_EI)
autocmd VimEnter,WinEnter * match Cursor /\%#./

function! HighlightCursor( isOn, key )
	" :highlight! Cursor gui=reverse guifg=NONE guibg=NONE
	if a:isOn
		match Cursor /\%#./
		redraw
	else
		match
	endif
	return a:key
endfunction

nnoremap <expr> : HighlightCursor(1, ':')
cnoremap <expr> <CR> HighlightCursor(0, "\<lt>CR>")


" "auto update content when changed elsewhere $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"


" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
" log.address

" autocmd FileChangedShellPost *
"   \ echohl WarningMsg | echo "Buffer changed!" | echohl None

" Rpeatly showing warining when reading buffers
" autocmd FileChangedShellPost *
"   \ if expand("<afile>") !=? g:log_address |
"   \ echohl WarningMsg | echo "File " . expand("<afile>") . " changed on disk. Buffer reloaded." | echohl None
"   \ | endif


" autocmd! VimEnter * AutoRead

set autoread   " doesn't work

augroup auto_read
	au!

	" Triger `autoread` when files changes on disk
	" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
	" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
	\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
	" Update a buffer's contents on focus if it changed outside of Vim.
	" https://vi.stackexchange.com/questions/14315/how-can-i-tell-if-im-in-the-command-window
	" :checktime
	" au FocusGained,BufEnter *
	"     \ if mode() == 'n' && getcmdwintype() == '' | checktime | endif

	au FocusGained,BufEnter * :silent! !
augroup END

" "auto update content when changed elsewhere $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

" Deprecated
" command! -nargs=0 W call boot#write_generic()
" :cnoreabbrev <expr> w! getcmdtype() == ":" && getcmdline() == 'w!' ? 'W' : 'w'

" "roxma/vim-tmux-clipboard",
" let g:vim_tmux_clipboard#loadb_option = '-w'

" Don't always show the relativenumbaer
augroup numbertoggle
	autocmd!
	" autocmd BufEnter,FocusGained,InsertLeave * set relativenumber | let $TERM = 'linux' | set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber | let $TERM = 'linux' | call HighlightCursor(1, ':')
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber | let $TERM = 'linux' | call HighlightCursor(1, ':')
augroup END

if $TERM =~? "tmux-256color"
augroup CursorRestore
	autocmd!
	" autocmd VimLeave * set guicursor=a:ver10-blinkon0
	" autocmd VimLeave * set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
	autocmd VimLeave * set guicursor=a:ver25
	\ | silent ! echo -ne "$cursor_code" | ! tput reset | ! setterm --term "linux" --cursor on
	" \ | silent ! echo -ne "\033]12\007" | ! tput reset | ! setterm --term "linux" --cursor on
augroup END
endif

]])


vim.api.nvim_create_autocmd('FileType', {
	--  pattern = 'sh',
	pattern = 'bash',
	callback = function()
		vim.lsp.start({
			name     = 'bash-language-server',
			cmd      = { 'bash-language-server', 'start' },
			--  cmd  = { 'bash-language-server', 'stop' },
		})
	end,
})









