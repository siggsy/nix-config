{ config, lib, pkgs, ...}:

let
  inherit (import ../variables.nix) nixosConfigDir mainUser;
in
{
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      layout = "us";
      xkbOptions = "caps:swapescape";
    };
  };
}
