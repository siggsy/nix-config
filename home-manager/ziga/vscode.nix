{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      vscodevim.vim
      redhat.java
      vscjava.vscode-maven
      vscjava.vscode-gradle
      vscjava.vscode-java-debug
      vscjava.vscode-java-dependency
      vscjava.vscode-java-test
    ];
    userSettings = {
      "window.menuBarVisibility" = "toggle";
    };
  };
}