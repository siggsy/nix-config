{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    ../.
    ./dconf.nix
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
