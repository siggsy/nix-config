{ pkgs, ... }:

let
  inherit (import ../variables.nix) nixosConfigDir mainUser;
in
{
  nixpkgs.config = import ../pkgs/nixpkgs-config.nix;

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" "docker" ];
    theme = "robbyrussell";
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-nix
      gruvbox
      coc-nvim
      vim-fugitive
      vim-airline
      polyglot
      nerdtree
    ];
    extraConfig = ''
      "-----------------------------[General settings]-----------------------------"
        let mapleader=" "
        set expandtab
        set shiftwidth=4
        set tabstop=4
        set nocompatible
        set termguicolors
        set number

      " Enable newline and dab indicators
        set listchars=eol:↴,tab:\|\ 
        set list

      " Enable system clipboard
        set clipboard+=unnamedplus
        nnoremap c "_c

      " Navigation
        map <leader>h <C-w>h
        map <leader>j <C-w>j
        map <leader>k <C-w>k
        map <leader>l <C-w>l
        map <leader>q <C-w>c

      " Clear search results
        noremap <silent> <leader>/ :let @/ = ""<CR>

      " Terminal configuration
        set splitbelow
        nnoremap <leader>` :split \| resize 10 \| term<CR>
        tnoremap jj <C-\><C-n>

      " Templates
        augroup templates
          autocmd BufNewFile *.c 0r ~/.config/nvim/templates/skeleton.c
          autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex
        augroup end

      " Compile a file using 'compiler' script
        nnoremap <leader>c :w! \| term compiler "<c-r>%"<CR>

      "-----------------------------[Plugins]-----------------------------"
      " Colorscheme
        let g:gruvbox_italic = 1
        let g:gruvbox_bold = 0
        let g:gruvbox_contrast_dark = 'hard'
        let g:onedark_terminal_italics=1
        let g:onedark_termcolors=16
        colorscheme gruvbox

      "-----------------------------[NERD tree]-----------------------------"

        nnoremap <leader>nn :NERDTreeFocus<CR>
        nnoremap <leader>N :NERDTree<CR>
        nnoremap <leader>nt :NERDTreeToggle<CR>
        nnoremap <leader>nf :NERDTreeFind<CR>

      "-----------------------------[coc keys]-----------------------------"

        set signcolumn=yes
        nnoremap <silent> K :call <SID>show_documentation()<CR>
        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
          execute 'h '.expand('<cword>')
          elseif (coc#rpc#ready())
          call CocActionAsync('doHover')
          else
          execute '!' . &keywordprg . " " . expand('<cword>')
          endif
        endfunction

        nmap <leader>rn <Plug>(coc-rename)
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        " TAB completion
        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~ '\s'
        endfunction

        inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<Tab>" :
          \ coc#refresh()
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        
        " Code action and quickfix
        nmap <leader>ca <Plug>(coc-codeaction)
        nmap <leader>cf <Plug>(coc-fix-current)
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)

      "-----------------------------[Git plugin]-----------------------------"

        nmap <leader>gs :G<CR>
        nmap <leader>gj :diffget //2<CR>
        nmap <leader>gf :diffget //3<CR>

      "-----------------------------[University related]-----------------------------"

      " P2 Makefile testing
        map <leader>t :w! \| vert new \| term export name='#:r' && make && make test<CR>
        map <leader>T :w! \| vert new \| term vmtest '#:r' '#:p:h'<CR>
        nnoremap <leader>C :w!<CR>
              \/\/\/ in:<CR>
              \<C-v>%hd$viB"iyu
              \/\/\/ out:<CR>
              \<C-v>%hd$viB"oyu
              \:let @/ = ""<CR>
              \:term gcc -o '%:r' -std=c99 -Wall -pedantic -lm % &&
              \diff -u <(echo "<c-r>i" \| tr -d '\r' \| ./'%:r') <(echo "<c-r>o" \| tr -d '\r') && echo "\033[1;32mok\033[0;38m"<CR><CR>

      " OIS Web development
        map <leader>W :w! \| term browser-sync start --server --files '%:p:h' --index <c-r>%<CR>

      " ARS HIP files
        au BufNewFile,BufRead *.s setlocal ft=nasm ff=dos
    '';
  };

  programs.git = {
    enable = true;
    userName = "siggsy";
    userEmail = "ziga@leskovec.xyz";
  };

  gtk = {
    enable = true;
    theme.name = "Materia-dark-compact";
    iconTheme = {
      name = "Papirus-Dark";
    };
  };
  xdg.configFile = {
    "nixpkgs/config.nix".source = ../pkgs/nixpkgs-config.nix;
  };

  home.packages = with pkgs; [
    # System utils
    konsole
    htop

    # Development
    python3

    # Editors
    vscode
    marktext

    # Image related
    krita
    ffmpeg
    
    # Web
    firefox
    google-chrome
    youtube-dl

    # Chat
    zoom-us
    discord

    # Themes
    gnome3.gnome-tweaks
    materia-theme
    papirus-icon-theme

  ];
}
