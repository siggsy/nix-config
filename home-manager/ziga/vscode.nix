{ inputs, outputs, lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
    direnv
  ];

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

    userSettings = {
      # Style
      "window.menuBarVisibility" = "toggle";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "catppuccin.accentColor" = "pink";
      "catppuccin.colorOverrides" = {
          "mocha" = {
              "base" = "#000000";
              "mantle" = "#010101";
              "crust" = "#020202";
          };
      };
      "catppuccin.customUIColors" = {
          "mocha" = {
              "statusBar.foreground" = "accent";
          };
      };

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