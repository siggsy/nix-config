{ config, lib, pkgs, ... }:

{
  nixpkgs.config = import ../pkgs/nixpkgs-config.nix;
  
  environment.pathsToLink = [
    "/share"
  ];
  
  programs.adb.enable = true;
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    neovim
  ];
}	
