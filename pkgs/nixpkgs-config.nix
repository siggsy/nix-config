{ pkgs, ... }:

let 
  UnstableRepo = import ( builtins.fetchTarball "https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz" ) { };
  inherit ( import ../variables.nix ) nixosConfigDir;
in
{
  allowUnfree = true;
  allowBroken = true;
  packageOverrides = pkgs: {
    unstable = UnstableRepo;
    # Overriden packages here:
    # eg.: vimCustom = pkgs.callPackage ( builtins.toPath "${nixosConfigDir}/pkgs/overrides/vim.nix" ) { };
    mySt = pkgs.callPackage (builtins.toPath "${nixosConfigDir}/pkgs/overrides/st.nix") { };
  };
}
