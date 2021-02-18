"===============================================================================
" Plugin source
"===============================================================================
"'mhinz/vim-startify'

"===============================================================================
" Plugin Configurations
"===============================================================================
" Highlight the acsii banner with green font
hi StartifyHeader ctermfg=76
" Don't change the directory when opening a recent file with a shortcut
let g:startify_change_to_dir = 0
" Set the contents of the banner

let g:startify_custom_header = [
            \ "  .o888b. .88b  d88.  .d8b.  d888888b d888888b    d88b .88b  d88.  .d88b.  d8888b. d8888b. d888888b .d8888.  .d88b.  d8b   db  ",
            \ " d8'   Y8 88'YbdP`88 d8' `8b `~~88~~' `~~88~~'    `8P' 88'YbdP`88 .8P  Y8. 88  `8D 88  `8D   `88'   88'  YP .8P  Y8. 888o  88  ",
            \ " 8P db dP 88  88  88 88ooo88    88       88        88  88  88  88 88    88 88oobY' 88oobY'    88    `8bo.   88    88 88V8o 88  ",
            \ " 8b V8o8P 88  88  88 88~~~88    88       88        88  88  88  88 88    88 88`8b   88`8b      88      `Y8b. 88    88 88 V8o88  ",
            \ " Y8.    d 88  88  88 88   88    88       88    db. 88  88  88  88 `8b  d8' 88 `88. 88 `88.   .88.   db   8D `8b  d8' 88  V888  ",
            \ "  `Y888P' YP  YP  YP YP   YP    YP       YP    Y8888P  YP  YP  YP  `Y88P'  88   YD 88   YD Y888888P `8888Y'  `Y88P'  VP   V8P  ",
            \]

" The number of files to list.
let g:startify_show_files_number = 10
" A list of files to bookmark. Always shown
let g:startify_bookmarks = [ '~/.vimrc' ]
" Replace startify buffer when opening file from vimfiler
autocmd User Startified setlocal buftype=

"===============================================================================
" Plugin Keymappings
"===============================================================================
nnoremap <Leader>sr  :Startify<CR>

"===============================================================================
" Unite Keymap Menu Item(s)
"===============================================================================
let g:unite_source_menu_menus.CustomKeyMaps.command_candidates += [['➤ Startify                                                      <Leader>sr', 'Startify']]
