{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home.url = "github:rycee/home-manager/bqv-flakes";
    hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, unstable, home, hardware }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
       { 
         system.configurationRevision = 
           if self ? rev
           then self.rev
           else throw "Refusing to build from a dirty Git tree!";
       }
       nixpkgs.nixosModules.notDetected
       ./hosts/thinkpad-x220.nix
       ./profiles/base/default.nix
       hardware.nixosModules.lenovo-thinkpad-x220
       ./profiles/x11.nix
       home.nixosModules.home-manager
       ./modules/core.nix
       ./modules/misc.nix
       ./modules/window-managers/i3.nix
      ];
      specialArgs = { inherit inputs; };
    };
    nixos = self.nixosConfigurations.nixos.config.system.build.toplevel;
  };
}
