{ pkgs, ... }:

let
  inherit (import ../variables.nix) nixosConfigDir mainUser;
in
{
  nixpkgs.config = import ../pkgs/nixpkgs-config.nix;

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;

  home.packages = with pkgs; [
    # System utils
    htop

    # Development
    git python3 go gcc openjdk

    # Editors
    neovim vscode android-studio
    jetbrains.idea-ultimate
    jetbrains.idea-community

    # Image related
    krita
    ffmpeg
    
    # Web
    firefox
    google-chrome
    youtube-dl

    # Themes
    gnome3.gnome-tweaks
    materia-theme
    yaru-theme
    papirus-icon-theme
  ];
}
