{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home.url = "github:rycee/home-manager/bqv-flakes";
    hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, unstable, home, hardware }@inputs: {
    nixosConfigurations.container = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
       { 
         system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
       }
       inputs.hardware.nixosModules.lenovo-thinkpad-x220
       ./hosts/thinkpad-x220/configuration.nix
       ./profiles/base/default.nix
       home.nixosModules.home-manager
       ./modules/default.nix
       ./profiles/sway/default.nix
       nixpkgs.nixosModules.notDetected
      ];
      specialArgs = { inherit inputs; };
    };
    container = inputs.self.nixosConfigurations.container.config.system.build.toplevel;
  };
}
