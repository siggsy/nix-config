{ config, lib, pkgs, ...}:

let
  inherit (import ../variables.nix) mainUser;
  home-manager = import (builtins.fetchTarball "https://github.com/rycee/home-manager/archive/release-20.09.tar.gz" ) { };
in
{
  imports = [ home-manager.nixos ];
  
  users.users.${mainUser} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" ];
    shell = pkgs.zsh;
  };
  home-manager.users.${mainUser} = import ./mainuser.nix;
}
