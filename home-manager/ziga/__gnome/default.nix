{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./dconf.nix
  ];

  home.packages = with pkgs.gnomeExtensions; [
    appindicator
  ];
}