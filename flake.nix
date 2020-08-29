{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home = {
      url = "github:rycee/home-manager/bqv-flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, unstable, home }@inputs: {
    nixosConfigurations.container = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
       { 
         system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
       }
       nixpkgs.nixosModules.notDetected
       home.nixosModules.home-manager
       ./thinkpad-x220.nix
       ./home.nix
      ];
      specialArgs = { inherit inputs; };
    };
    container = inputs.self.nixosConfigurations.container.config.system.build.toplevel;
  };
}
