{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../.
    inputs.hardware.nixosModules.asus-zephyrus-ga402
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
  ];

  networking.hostName = "gamma";

  users.users.ziga = {
    isNormalUser = true;
    description = "Žiga Leskovec";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      ziga = import ../../home-manager/ziga/gamma/home.nix;
    };
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.printing.enable = true;

  services.openssh = {
    enable = false;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

}
