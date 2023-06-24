{ inputs, outputs, lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
    direnv
  ];

  xdg.configFile."VSCodium/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink
    ./settings.json;

  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    mutableExtensionsDir = false;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
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