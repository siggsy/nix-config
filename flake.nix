{
  description = "Why are we still here";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Repo with daily vscode extension updates
    nixvsc.url = "github:nix-community/nix-vscode-extensions";

    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    with nixpkgs.lib;
    with nixpkgs.lib.attrsets;
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      # Helper function for adding new hosts to configuration
      # TODO: automatically scan for directories to avoid manual import
      mkHost = host: nameValuePair host (nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./nixos/${host}/configuration.nix
        ];
      });

      # Helper function for adding home-manager configurations
      # TODO: automatically scan for directories to avoid manual import
      mkHome = name: host: nameValuePair "${name}@${host}" (home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home-manager/${name}/${host}/home.nix
        ];
      });

    in
    rec {
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
      );

      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );

      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = builtins.listToAttrs [
        (mkHost "gamma")
      ];

      homeConfigurations = builtins.listToAttrs [
        (mkHome "ziga" "gamma")
      ];
    };
}
