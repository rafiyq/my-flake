{
  description = "NixOS reproducible environment with flakes";
  inputs = {
    stable.url = "github:NixOS/nixpkgs/nixos-20.03";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home.url = "github:rycee/home-manager/bqv-flakes";
    home.inputs.nixpkgs.follows = "stable";

    wayland.url = "github:colemickens/nixpkgs-wayland";
    wayland.inputs.nixpkgs.follows = "stable";
  };

  outputs = { self, stable, unstable, home, wayland }: {

    nixosConfigurations.container = stable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./thinkpad-x220.nix
        ./configuration.nix
        ./modules/home.nix
      ];
    };

  };
}
