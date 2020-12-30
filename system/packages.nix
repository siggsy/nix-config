{ config, lib, pkgs, ... }:

{
  nixpkgs.config = import ../pkgs/nixpkgs-config.nix;
  
  environment.pathsToLink = [
    "/share"
  ];
  
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    neovim
  ];
}	
