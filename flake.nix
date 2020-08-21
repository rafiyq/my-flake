{
  description = "NixOS reproducible environment with flakes";
  inputs = {
    stable.url = "github:NixOS/nixpkgs/nixos-20.03";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home.url = "github:rycee/home-manager/bqv-flakes";
    home.inputs.nixpkgs.follows = "stable";

    wayland.url = "github:colemickens/nixpkgs-wayland";
    wayland.inputs.nixpkgs.follows = "cmpkgs";
    wayland.inputs.master.follows = "master";
  };

  outputs = { self, stable, unstable, home, wayland }: {

    nixosConfigurations.container = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules =
        [ ({ pkgs, ... }: {
            boot.isContainer = true;

            # Let 'nixos-version --json' know about the Git revision
            # of this flake.
            system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;

            # Network configuration.
            networking.useDHCP = false;
            networking.firewall.allowedTCPPorts = [ 80 ];

            # Enable a web server.
            services.httpd = {
              enable = true;
              adminAddr = "morty@example.org";
            };
          })
        ];
    };

  };
}
