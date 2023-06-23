{ inputs, outputs, lib, config, pkgs, ... }: {
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

      # Nix
      bbenoist.nix

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

    userSettings = {
      # Visibility
      "window.menuBarVisibility" = "toggle";
      "workbench.iconTheme" = "material-icon-theme";

      # Editor
      "editor.fontFamily" = "Victor Mono";
      "editor.fontWeight" = 600;
      "terminal.integrated.fontFamily" = "Victor Mono";
      "terminal.integrated.fontWeight" = 600;

      "editor.insertSpaces" = true;
      "[nix]"."editor.tabSize" = 2;
      "[haskell]"."editor.tabSize" = 2;
    };
  };
}