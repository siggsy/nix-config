{ pkgs, makeDesktopItem }:

pkgs.st.overrideAttrs (oldAttrs: rec {
  src = pkgs.fetchFromGitHub {
      owner = "LukeSmithxyz";
      repo = "st";
      rev = "8ab3d03681479263a11b05f7f1b53157f61e8c3b";
      sha256 = "1brwnyi1hr56840cdx0qw2y19hpr0haw4la9n0rqdn0r2chl8vag";
  };
  buildInputs = oldAttrs.buildInputs ++ [ pkgs.harfbuzz ];
  desktopItem = makeDesktopItem {
    name = "Simple Terminal";
    icon = "utilities-terminal";
    exec = "st";
    comment = "Custom built Simple terminal";
    genericName = "Terminal";
    desktopName = "Simple Terminal";
    categories = "System;TerminalEmulator;";
  };
  postPhases = [ "postInstall" ];
  postInstall = '' 
    mkdir -p $out/share/applications/
    cp ${desktopItem}/share/applications/* $out/share/applications/
  '';
})
