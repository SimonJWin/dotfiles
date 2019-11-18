" Enable modern Vim features not compatible with Vi spec.
set nocompatible
filetype off

" Explicitly set the Leader to comma.
let mapleader=','

" Line wrapping? No!
set nowrap

" Relative line number hybrid mode...
set number
set relativenumber
" ...but normal line numbers in Insert mode.
autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Use the system copy/paste by default for yank/put.
set clipboard=unnamed

" Highlight the search term when you search for it, but don't highlight
" just because we've sourced vimrc
set hlsearch
let @/ = ""
" Key to clear search
nnoremap <leader>cs :let @/=''<CR>

" Tabs to spaces
set expandtab
set ts=2
set sw=2

" I'm not used to weird Vim backspace, make it work as expected.
set backspace=indent,eol,start

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

" Source corp config if it exists
call SourceIfExists("~/.vim/google.vim")

" Setup Vundle and plugins
set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  " Taskjuggler syntax
  Plugin 'kalafut/vim-taskjuggler'
  " Syntastic
  Plugin 'vim-syntastic/syntastic'
  " Fish integration
  Plugin 'dag/vim-fish'
  " Powerline
  Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
  " All the color schemes
  Plugin 'flazz/vim-colorschemes'

  " LSP support
  Plugin 'prabirshrestha/async.vim'
  Plugin 'prabirshrestha/vim-lsp'

  call vundle#end()
else
  echomsg 'Vundle not working, install from github VundleVim/Vundle.vim'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your plugins must be added before the following line.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on
syntax on

" Colors!
set t_C0=256

" Show when leader is active
set showcmd

" Textwidth
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
set colorcolumn=+1
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" " Allow "%%" to mean path of current file in command line
cabbr <expr> %% expand('%:p:h')

" No file.c~ files.  They are super-annoying, and we have git now.
set nobackup
set nowritebackup

""""""""""""""""""""""""
" Some custom keybinds "
""""""""""""""""""""""""
" Reload vimrc
nnoremap <leader>RR :source ~/.vimrc<CR>
" By default, it looks up man pages for the word under the cursor, which isn't
" very useful, so we map it to something else.
nnoremap <s-k> <CR>
" An easier way out of insert mode, particularly if no esc key (iPad).
inoremap jk <Esc>

" Automatically change the working path to the path of the current file
autocmd BufNewFile,BufEnter * silent! lcd %:p:h

" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" Powerline status
set laststatus=2

" Pick a colorscheme
colorscheme molokai
