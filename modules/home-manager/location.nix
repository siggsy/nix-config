{ config, lib, ... }: with lib; {
  options = {
    home.dotpath = mkOption {
      type = types.path;
      description = "Path to the dotfiles (eg. /path/to/home-manager/$username)";
      default = "${config.home.homeDirectory}/.dotfiles/home-manager/${config.home.username}";
    };
  };
}