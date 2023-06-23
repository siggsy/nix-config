{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    ../.
    ./dconf.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [

    steam
    firefox
    discord
    spotify

    victor-mono

  ];

}
