{ inputs, outputs, lib, config, pkgs, dotfiles, ... }: {

  home.packages = with pkgs; [
    direnv
  ];

  # Settings file symlinked for vscode and vscodium
  home.file.".config/VSCodium/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles.ziga.dotfiles}/__vscode/settings.json";
  home.file.".config/Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles.ziga.dotfiles}/__vscode/settings.json";

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with inputs.nixvsc.extensions.x86_64-linux.vscode-marketplace; [
      # Vscode
      vscodevim.vim
      pkief.material-icon-theme
      catppuccin.catppuccin-vsc

      # Nix
      bbenoist.nix
      mkhl.direnv

      # Java
      redhat.java
      vscjava.vscode-maven
      vscjava.vscode-gradle
      vscjava.vscode-java-debug
      vscjava.vscode-java-dependency
      vscjava.vscode-java-test

      # Haskell
      haskell.haskell
      justusadam.language-haskell
    ];
  };
}