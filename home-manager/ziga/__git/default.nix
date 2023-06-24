{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "siggsy";
    userEmail = "ziga@leskovec.xyz";
    
    extraConfig = {
      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = "false";
      };

      core = {
        autocrlf = "input";
      };
    };
  };
}