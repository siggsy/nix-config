{ inputs, outputs, lib, config, pkgs, ... }: {

  options = {
    home.dotpath = mkOption {
      type = types.path;
      description = "Path to the dotfiles (eg. /path/to/home-manager/$username)";
      default = "${config.home.homeDirectory}/.dotfiles/home-manager/${config.home.username}";
    };
  };

  config = {
    nixpkgs = {
      # You can add overlays here
      overlays = [
        # Add overlays your own flake exports (from overlays and pkgs dir):
        outputs.overlays.additions
        outputs.overlays.modifications
        outputs.overlays.unstable-packages
      ];
      # Configure your nixpkgs instance
      config = {
        # Disable if you don't want unfree packages
        allowUnfree = true;
        # Workaround for https://github.com/nix-community/home-manager/issues/2942
        allowUnfreePredicate = (_: true);
      };
    };

    systemd.user.startServices = "sd-switch";
    programs.home-manager.enable = true;
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "23.05";
  };

}