{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "siggsy";
    userEmail = "ziga@leskovec.xyz";
  };
}