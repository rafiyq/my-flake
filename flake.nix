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
       ./hosts/thinkpad-x220/hardware-configuration.nix
       nixpkgs.nixosModules.notDetected
       hardware.nixosModules.lenovo-thinkpad-x220
       ./profiles/base/default.nix
       home.nixosModules.home-manager
       ./modules/core/default.nix
       #./profiles/sway/default.nix
      ];
      specialArgs = { inherit inputs; };
    };
    nixos = self.nixosConfigurations.nixos.config.system.build.toplevel;
  };
}
