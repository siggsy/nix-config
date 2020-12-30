{ config, lib, pkgs, ... }:

{
  imports =
    [
      # System configuration
      ./system/hardware.nix
      ./system/general-options.nix
      ./system/packages.nix
      ./system/services.nix
      ./system/fonts.nix

      # User configuration
      ./users/users.nix
    ];

  system.stateVersion = "20.09"; # System version.
  system.autoUpgrade.enable = true; # Enable auto system upgrade.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix.gc.automatic = true; # Automatically collect garbage.
  nix.gc.dates = "18:00"; # When to collect garbage.
}

