{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
    home = {
      url = "github:rycee/home-manager/bqv-flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs }: {

    nixosConfigurations.container = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
       { system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev; }
       .configuration.nix
       nixpkgs.nixosModules.notDetected
       home.nixosModules.home-manager
      ];
    };

  };
}
