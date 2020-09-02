
"normal mode

nnoremap <SPACE> <Nop>
let mapleader=" "

"noremap <Esc>; :

nnoremap <Esc>qq :q<CR>
nnoremap <Esc>QQ ZQ
nnoremap <Esc>wq ZZ
noremap <C-s> :w<CR>

nnoremap <Space>wq :q<CR>
nnoremap <Space>ws :w<CR>

nnoremap <Space>wi <C-w>k
nnoremap <Space>wj <C-w>h
nnoremap <Space>wk <C-w>j
nnoremap <Space>wl <C-w>l


noremap b z
noremap <S-b> <S-z>
noremap YY ZZ

noremap t "
noremap " `
noremap y m

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

noremap w i
noremap e a
noremap d d
noremap f c
noremap <S-w> I
noremap <S-e> A
noremap <S-d> D
noremap <S-f> C

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

noremap x .

" Alias replace all to
nnoremap <A-s> :%s//gI<Left><Left><Left>

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

