{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    ../.
    ./dconf.nix
    ../vscode.nix
  ];

  home.sessionVariables = {
    STEAM_FORCE_DESKTOPUI_SCALING = "1";
  };

  home.packages = with pkgs; [

    steam
    firefox
    discord
    spotify

    victor-mono

  ];

}
