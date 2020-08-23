{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
    home = {
      url = "github:rycee/home-manager/bqv-flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home }: {

    nixosConfigurations.container = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
       { system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev; }
       ./profiles/sway.nix
       nixpkgs.nixosModules.notDetected
       home.nixosModules.home-manager
      ];
    };

  };
}
