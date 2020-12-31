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
    plugins = with pkgs.vimPlugins; [ vim-airline vim-nix gruvbox ];
    extraConfig = ''
      colorscheme gruvbox
    '';
  };

  programs.git = {
    enable = true;
    userName = "lolek159";
    userEmail = "zigaleskovec@gmail.com";
  };

  gtk = {
    enable = true;
    theme.name = "Materia-dark-compact";
    iconTheme = {
      name = "Papirus-Dark";
    };
  };

  home.packages = with pkgs; [
    # System utils
    htop

    # Development
    python3 go gcc openjdk

    # Editors
    mySt
    vscode
    marktext

    # Image related
    krita
    ffmpeg
    
    # Web
    google-chrome
    youtube-dl

    # Chat
    zoom-us
    discord

    # Themes
    gnome3.gnome-tweaks
    materia-theme
    yaru-theme
    papirus-icon-theme
  ];
}
