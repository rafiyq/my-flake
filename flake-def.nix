{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:rycee/home-manager";
    emacs.url = "github:nix-community/emacs-overlay";
    hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = inputs: {
    nixosConfigurations.nixos = {
      hostname = let
        system = "x86_64-linux";
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        inherit (inputs.nixpkgs) lib;

        # Things in this set are passed to modules and accessible
        # in the top-level arguments (e.g. `{ pkgs, lib, inputs, ... }:`).
        specialArgs = {
          inherit inputs;
        };

        hm-nixos-as-super = { config, ... }: {
          # Submodules have merge semantics, making it possible to amend
          # the `home-manager.users` submodule for additional functionality.
          options.home-manager.users = lib.mkOption {
            type = lib.types.attrsOf (lib.types.submoduleWith {
              modules = [ ];
              # Makes specialArgs available to Home Manager modules as well.
              specialArgs = specialArgs // {
                # Allow accessing the parent NixOS configuration.
                super = config;
              };
            });
          };
        };

        modules = [
          { 
             nixpkgs.overlays = [ inputs.emacs.overlay ];
             #system.configurationRevision = 
             #  if self ? rev
             #  then self.rev
             #  else throw "Refusing to build from a dirty Git tree!";
          }

          inputs.hardware.nixosModules.lenovo-thinkpad-x220
          (import ./hosts/nixos)

          inputs.home.nixosModules.home-manager
          (import ./modules/core.nix)

          inputs.nixpkgs.nixosModules.notDetected
          hm-nixos-as-super
        ];
      in lib.nixosSystem { inherit system modules specialArgs; };
    };
  };
}
