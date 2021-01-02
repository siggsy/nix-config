{ config, lib, pkgs, ... }:

let
  inherit (import ../variables.nix) nixosConfigDir mainUser;
in
{
  # Use grub
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };
  };

  # Enable virtualisation
  virtualisation.libvirtd.enable = true;

  # Networking
  networking.hostName = "ziga-thinkpad";
  networking.networkmanager.enable = true;

  # Fonts and locale
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Ljubljana";
}
