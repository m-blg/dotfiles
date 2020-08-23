call plug#begin('~/local/share/nvim/plugged')

" Color themes
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'tomasiser/vim-code-dark'
Plug 'w0ng/vim-hybrid'

" Essentials
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'

" Extras
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

"set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?


"set background=dark
"colorscheme gruvbox
set termguicolors
colorscheme codedark

let g:lightline = { 'colorscheme': 'seoul256' }

set clipboard+=unnamedplus
set nocompatible
syntax on
let g:cpp_class_decl_highlight = 1
set number
set relativenumber
filetype plugin indent on
set tabstop=4
" show existing tab with 4 spaces width
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set mouse=a mousemodel=popup

set wildmode=longest,list,full

" Nerd Tree config
map <C-f> :NERDTreeToggle<CR>
let NERDTreeMenuUp='i'
let NERDTreeMenuDown='k'
let NERDTreeMapOpenSplit='y'

"coc config
"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
" end of coc config 

"normal mode

nnoremap <SPACE> <Nop>
let mapleader=" "

"noremap <Esc>; :

nnoremap <Esc>qq :q<CR>
nnoremap <Esc>QQ ZQ
nnoremap <Esc>wq ZZ
noremap <C-s> :w<CR>

noremap b z
noremap <S-b> <S-z>
noremap YY ZZ

"noremap t '
"noremap T "

noremap i k
noremap j h
noremap k j
noremap u b
noremap o e
"noremap h ^
"noremap ' g_
noremap p %

noremap <S-i> <C-u>
noremap <S-j> ge
noremap <S-k> <C-d>
noremap <S-l> w
noremap <S-o> E
noremap <S-u> B
"noremap <S-h> 0
"noremap " $

noremap gi H
noremap gk L
noremap gm M
noremap gj ^
noremap gl g_
noremap gJ 0
noremap gL $
noremap gt gg
noremap gb G

noremap <Space>t zt
noremap <Space>g zz
noremap <Space>b zb

let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4;m"
noremap <C-k> <C-e>
noremap <C-i> <C-y>
" noremap <C-i> <C-y>
" noremap <C-k> <C-e>
" noremap <C-y> zt
" noremap <C-h> zz
" noremap <C-n> zb


noremap n <S-f>
noremap m f
noremap <S-n> <S-t>
noremap <S-m> t

noremap . n
noremap > N

noremap z u
noremap <S-z> <C-r>

noremap e i
noremap r a
noremap d d
noremap f c
noremap x r
noremap <S-e> I
noremap <S-r> A
noremap <S-d> D
noremap <S-f> C
noremap <S-x> R

noremap <CR> o
noremap <S-CR> <S-O>

noremap c y
noremap v p
noremap <S-c> <S-y>
noremap <S-v> <S-p>

noremap s v
noremap <S-s> <S-v>
map <Space>s <Nop>
noremap <Space>s <C-v>

noremap a <S-x>
noremap <S-a> x

noremap w .

" Deletion
nnoremap dd dd
nnoremap dw diw
nnoremap dp dip
nnoremap db dib
nnoremap dW diW
nnoremap dP diP
nnoremap dB diB
nnoremap d' di'
nnoremap d" di"

nnoremap d<Space>w daw
nnoremap d<Space>p dap
nnoremap d<Space>b dab
nnoremap d<Space>W daW
nnoremap d<Space>P daP
nnoremap d<Space>B daB
nnoremap d<Space>' da'
nnoremap d<Space>" da"

" Changing
nnoremap ff cc
nnoremap fw ciw
nnoremap fp cip
nnoremap fb cib
nnoremap fW ciW
nnoremap fP ciP
nnoremap fB ciB
nnoremap f' ci'
nnoremap f" ci"

nnoremap f<Space>w caw
nnoremap f<Space>p cap
nnoremap f<Space>b cab
nnoremap f<Space>W caW
nnoremap f<Space>P caP
nnoremap f<Space>B caB
nnoremap f<Space>' ca'
nnoremap f<Space>" ca"

" Copying
nnoremap cc yy
nnoremap cw yiw
nnoremap cp yip
nnoremap cb yib
nnoremap cW yiW
nnoremap cP yiP
nnoremap cB yiB
nnoremap c' yi'
nnoremap c" yi"

nnoremap c<Space>w yaw
nnoremap c<Space>p yap
nnoremap c<Space>b yab
nnoremap c<Space>W yaW
nnoremap c<Space>P yaP
nnoremap c<Space>B yaB
nnoremap c<Space>' ya'
nnoremap c<Space>" ya"

noremap <Tab> >>
noremap <S-Tab> <<

nnoremap <Esc>j <S-j>

" easy motion rebind
map <Space>i <Plug>(easymotion-k)
map <Space>k <Plug>(easymotion-j)
map <Space>l <Plug>(easymotion-w)
map <Space>j <Plug>(easymotion-b)
map <Space><S-l> <Plug>(easymotion-W)
map <Space><S-j> <Plug>(easymotion-B)
map <Space>m <Plug>(easymotion-f)
map <Space>n <Plug>(easymotion-F)
map <Space>; <Plug>(easymotion-repeat)

"insert mode

"inoremap <C> <Esc>
"inoremap <C-f> <Esc>

"visual mode

vnoremap w aw
vnoremap b ib
vnoremap B iB
vnoremap [ v<s-t>[v,
vnoremap t it
vnoremap p v{<Down>v}<Up>g_

vnoremap <Space>w aw
vnoremap <Space>b ab
vnoremap <Space>B aB
vnoremap <Space>t at
vnoremap <Space>p v{v}g_ 
vnoremap <Space>' v<s-f>'v,
vnoremap <Space>" v<s-f>"v,

vnoremap ew iw
vnoremap eb ib
vnoremap eB iB
vnoremap e[ v<s-t>[v,
vnoremap et it
vnoremap ep v{<Down>v}<Up>g_
vnoremap e' v<s-t>'v,
vnoremap e" v<s-t>"v,

vnoremap rw aw
vnoremap rb ab
vnoremap rB aB
vnoremap rt at
vnoremap rp v{v}g_ 
vnoremap r' v<s-f>'v,
vnoremap r" v<s-f>"v,

"vnoremap <leader>/ :norm E"<Space><CR>

