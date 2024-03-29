{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    ../.
    ./__zsh
    ./__git
  ];

  home = {
    username = "ziga";
    homeDirectory = "/home/ziga";
  };

  accounts.email = {
    accounts.personal = {
      primary = true;
      userName = "ziga";
      address = "ziga@leskovec.xyz";
      imap = {
        host = "imap.leskovec.xyz";
        port = 143;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };
      smtp = {
        host = "smtp.leskovec.xyz";
        port = 587;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };
    };
  };

}