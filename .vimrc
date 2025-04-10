filetype plugin indent on "Включает определение типа файла, загрузку...
"... соответствующих ему плагинов и файлов отступов
set encoding=utf-8 "Ставит кодировку UTF-8
set nocompatible "Отключает обратную совместимость с Vi
syntax enable "Включает подсветку синтаксиса

if empty(glob('~/.vim/autoload/plug.vim')) "Если vim-plug не стоит
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs "Создать директорию
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  "И скачать его оттуда
  "А после прогнать команду PlugInstall, о которой мы сейчас поговорим
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle') "Начать искать плагины в этой директории
"Тут будут описаны наши плагины:
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-airline/vim-airline' 
Plug 'ryanoasis/vim-devicons' "Далее я про это напоминать не буду

call plug#end() "Перестать это делать
"После чего перезагружаем файл настроек...
"... и исполняем команду :PlugInstall в панели команд

colorscheme sublimemonokai

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу

"Сам по себе number показывает справа номера строк
"relativenumber - нумерацию строк относительно положения курсора
set number relativenumber "А это гибридный вариант. Протестируйте все


"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
set wrap linebreak nolist "Данная вариация работает как wrap...
"... но переносит строчки не посимвольно, а по словам

set cursorline "А так мы можем подсвечивать строку с курсором

"Если вы используете обычный терминальный Вим, а не NeoVim, то...
"... для изменения курсора в разных режимах используйте это:
set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[1 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on



call plug#begin()
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mkitt/tabline.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'wakatime/vim-wakatime'
call plug#end()

"+Pale Green 1+
"#87ffaf
hi Comment ctermfg=121
hi xmlCdataStart ctermfg=121
hi LspCodeLens ctermfg=121

set number
set spelllang=en
set spell
set listchars=eol:$,space:·,tab:╓─,trail:▫

nmap <F5> :set list! list?<cr>

nmap <tab> :tabnext<cr>
nmap <S-tab> :tabprevious<cr>
nmap <silent><leader>n :NERDTreeToggle<cr>
nmap <c-j> 5j
nmap <c-k> 5k
"map <down> <c-w><down>
"map <left> <c-w><left>
"map <right> <c-w><right>
"map <up> <c-w><up>
