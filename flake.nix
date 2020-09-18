{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home.url = "github:rycee/home-manager";
    emacs.url = "github:nix-community/emacs-overlay";
    hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nix, ... }@inputs: {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
       { 
         nixpkgs.overlays = [ inputs.emacs.overlay ];
         system.configurationRevision = 
           if self ? rev
           then self.rev
           else throw "Refusing to build from a dirty Git tree!";
       }

       inputs.hardware.nixosModules.lenovo-thinkpad-x220
       (import ./hosts/nixos)

       inputs.home.nixosModules.home-manager
       (import ./users/home.nix)
       (import ./users/misc.nix)
       (import ./users/programs/core.nix)
       (import ./users/programs/x11.nix)
       (import ./users/services.nix)
       (import ./users/window-managers/i3.nix)

       inputs.nixpkgs.nixosModules.notDetected
      ];
      specialArgs = { inherit inputs; };
    };
    nixos = inputs.self.nixosConfigurations.nixos.config.system.build.toplevel;
  };
}
