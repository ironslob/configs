set shiftwidth=4
"set textwidth=80
set softtabstop=4
set tabstop=4
set expandtab
set ignorecase
set enc=UTF-8
syntax on
if has("autocmd")
  filetype indent on
endif
set showcmd
set showmatch
set nohlsearch
set foldenable
set foldlevel=0
set foldmethod=indent
set incsearch
:let g:html_tag_case='lowercase'

" make sure certain file formats are adhered to
au BufNewFile,BufRead dhandler setf mason
au BufNewFile,BufRead autohandler setf mason
au BufNewFile,BufRead *.html setf mason
au BufNewFile,BufRead syshandler setf perl

" skeleton files
au BufNewFile *.py 0r ~/.vim/skel/pythonscript.vim
au BufNewFile *.pl 0r ~/.vim/skel/perlscript.vim
au BufNewFile *.pm 0r ~/.vim/skel/perlmodule.vim
au BufNewFile *.xsl 0r ~/.vim/skel/xslt.vim
au BufNewFile *.xslt 0r ~/.vim/skel/xslt.vim
au BufNewFile *.xml 0r ~/.vim/skel/xml.vim
au BufNewFile dhandler 0r ~/.vim/skel/dhandler.vim
au BufNewFile syshandler 0r ~/.vim/skel/syshandler.vim
au BufNewFile autohandler 0r ~/.vim/skel/autohandler.vim

au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
    let my_auto_commands_loaded = 1
    " Large files are > 10M
    " Set options:
    " eventignore+=FileType (no syntax highlighting etc
    " assumes FileType always on)
    " noswapfile (save copy of file)
    " bufhidden=unload (save memory when other file is viewed)
    " buftype=nowritefile (is read-only)
    " undolevels=-1 (no undo possible)
    let g:LargeFile = 1024 * 1024 * 10
    augroup LargeFile
        autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | syntax off | setlocal foldmethod=manual | else | set eventignore-=FileType | endif
        augroup END
    endif

" display all empty lines, and tabs
set listchars=tab:>-,trail:·
set bg=dark
