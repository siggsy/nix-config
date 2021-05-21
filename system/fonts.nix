{ config, lib, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      inconsolata
      fira-code
      jetbrains-mono
      noto-fonts
      noto-fonts-extra
      noto-fonts-emoji
      source-code-pro
    ];
  };
}
