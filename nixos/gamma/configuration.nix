{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    ../.
    inputs.hardware.nixosModules.asus-zephyrus-ga402
    ./hardware-configuration.nix
  ];

  networking.hostName = "gamma";

  environment.sessionVariables = {
    STEAM_FORCE_DESKTOPUI_SCALING = "1";
  };

  users.users.ziga = {
    isNormalUser = true;
    description = "Žiga Leskovec";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      ziga.imports = [ (pkgs.lib.my.mkDotpath "ziga" config.networking.hostName) ];
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
