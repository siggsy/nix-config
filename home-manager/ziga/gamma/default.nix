{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    ../.
    ../__gnome
    ../__vscode
  ];

  home.packages = with pkgs; [

    steam
    firefox
    discord
    spotify

    victor-mono

  ];

}