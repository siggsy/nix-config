{ inputs, outputs, lib, config, pkgs, ... }: rec {

  imports = [
    ./dconf.nix
  ];

  home.packages = with pkgs.gnomeExtensions; [
    appindicator
  ];

  dconf.settings = {
    "org/gnome/shell".enabled-extensions = map (extension: extension.extensionUuid) home.packages;
    "org/gnome/shell".disabled-extensions = [];
  };

}