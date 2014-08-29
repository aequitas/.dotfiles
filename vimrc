set modeline
colorscheme jellybeans
set wildmode=longest:full
set wildmenu
set number

filetype plugin indent on

set expandtab
autocmd FileType make setlocal noexpandtab
set tabstop=4
set shiftwidth=4
set smartindent
set pastetoggle=<F2>    

"imap <D-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>
"imap <D-V> ^O"+p

"highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
syntax enable

autocmd BufRead,BufNewFile *.ctp set filetype=php
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline
autocmd FileType make setlocal noexpandtab

nmap <C-N><C-N> :set invnumber<CR>
nmap <C-X><C-W> :set invwrap<CR>
set invwrap

map <C-J> :bn<CR>
map <C-K> :bp<CR>
set wmh=0
set shell=bash\ --login

"set hls
set incsearch
set diffopt+=iwhite

map <F5> <Esc>:w<CR>:!%:p<CR>

highlight! link DiffText MatchParen
map -j !python -m json.tool<CR>

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
set modeline

"execute pathogen#infect()


"....
set statusline+=%{StatuslineLongLineWarning()}
"....

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction
