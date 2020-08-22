{
  description = "NixOS reproducible environment with flakes";
  inputs = {
    stable.url = "github:NixOS/nixpkgs/nixos-20.03";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:rycee/home-manager/bqv-flakes";
    home-manager.inputs.nixpkgs.follows = "stable";

    wayland.url = "github:colemickens/nixpkgs-wayland";
    wayland.inputs.nixpkgs.follows = "stable";

    # hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, stable, unstable, home-manager, wayland }: {

    nixosConfigurations.container = stable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        {
          nixpkgs.overlays = [ wayland.overlay ];
        }
        stable.nixosModules.notDetected
        home-manager.nixosModules.home-manager
        ./thinkpad-x220.nix
        ./configuration.nix
        ./modules/home.nix
        ./profiles/sway.nix
      ];
    };

  };
}
