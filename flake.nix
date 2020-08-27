{
  inputs = {
<<<<<<< HEAD
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
=======
    stable.url = "github:NixOS/nixpkgs/nixos-20.03";
>>>>>>> master
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home = {
      url = "github:rycee/home-manager/bqv-flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

<<<<<<< HEAD
  outputs = { self, nixpkgs, unstable, home }: {
=======
  outputs = { self, stable, unstable, home }: {
>>>>>>> master

    nixosConfigurations.container = stable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
       { system.configurationRevision = stable.lib.mkIf (self ? rev) self.rev; }
       stable.nixosModules.notDetected
       home.nixosModules.home-manager
       ./thinkpad-x220.nix
       ./home.nix
      ];
    };
    container = self.nixosConfigurations.container.config.system.build.toplevel;
  };
}
